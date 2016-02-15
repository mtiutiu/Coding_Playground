/* 

	PWM controller using ATtiny13A

	The principle is very simple:
	- the pwm duty cycle is always increased(initially it stars from 0) and when the output voltage tends to be higher than required
	 the analog comparator senses that and decreases the pwm - this cycle repeats

	So by using the above principle we have a feedback loop which controls and sets the output voltage to a fixed value
	(the output voltage value is set by using an external potentiometer which changes the analog comparator threshold voltage)

*/

#include <avr/io.h>
#include <avr/interrupt.h>

const uint8_t MIN_PWM_VALUE = 0;
const uint8_t MAX_PWM_VALUE = 240;
volatile uint8_t pwm_value = MIN_PWM_VALUE;

void io_setup() {
	// set PWM pin as output
	DDRB |= (1 << DDB1);
}

void analog_comp_setup(void) {
	// disable AIN0 digital buffer as it's not needed(to conserve power)
	DIDR0 |= (1 << AIN0D);

	// select bandgap reference(1.1V) voltage for the positive input AIN0
	// set interrupts for falling edge
	ACSR |= (1 << ACBG) | (1 << ACIE) | (1 << ACIS1);

	ADCSRB |= (1 << ACME); // enable ADMUX to select one of the ADC pins for analog comparator AIN1
	ADMUX |= (1 << MUX1);	// select ADC2 pin as AIN1
	ADCSRA &= ~(1 << ADEN); // disable ADC
}

void pwm_setup (void) {
    // Set no prescaler for timer 0 - this gives ~ 37.5KHz frequency for PWM at Fcpu=9.6MHz
    TCCR0B |= (1 << CS00);
 
    // Set to 'Fast PWM' mode
    TCCR0A |= (1 << WGM01) | (1 << WGM00);
 
    // Clear OC0A output on compare match, upwards counting.
    TCCR0A |= (1 << COM0B1);
}
 
void pwm_write (int val) {
    OCR0B = val;
}

ISR(ANALOG_COMP_vect) {
	// this triggers when the output voltage tends to be higher than required
	if(pwm_value > MIN_PWM_VALUE) {
		--pwm_value;
	}
}

int main(void) {
	io_setup();
	pwm_setup();
	analog_comp_setup();
	sei();

	for(;;) {
		if(pwm_value <= MAX_PWM_VALUE) {
			++pwm_value;
		}
		pwm_write(pwm_value);
	}

	return 0;
}
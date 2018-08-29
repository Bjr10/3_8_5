// Main.c - makes LEDG0 on DE2-115 board blink if NIOS II is set up correctly
// for ECE 385 - University of Illinois - Electrical and Computer Engineering
// Author: Zuofu Cheng

int main()
{
//	int i = 0;
//	volatile unsigned int *LED_PIO = (unsigned int*)0x50; //make a pointer to access the PIO block
//	volatile unsigned int *acculmulate= (unsigned int*)0x30;
//	volatile unsigned int *switches= (unsigned int*)0x20;
//	volatile unsigned int *reset= (unsigned int*)0x40;
//	*LED_PIO = 0; //clear all LEDs
//	unsigned int adder=0;
//	unsigned int temp =0;
//	while ( (1+1) != 3) //infinite loop
//	{
//		if(!(*reset)){
//			adder = 0;
//			while (1) {
//				if (*reset) break;
//			}
//		 }
//		else if(!(*acculmulate)){
//	    	adder += *switches;
//			while (1) {
//				if (*acculmulate) break;
//			 }
//
//
//
//
//	    }
//
//
//
//		else if(adder> 255){
//	    	adder = adder- 256;
//
//	    }
//
//		//for (i = 0; i < 100000; i++); //software delay
//		*LED_PIO = adder; //set LSB
//
//	}
//	return 1; //never gets here
	int i = 0;
		volatile unsigned int *LED_PIO = (unsigned int*)0x50; //make a pointer to access the PIO block

		*LED_PIO = 0; //clear all LEDs
		while ( (1+1) != 3) //infinite loop
		{
			for (i = 0; i < 100000; i++); //software delay
			*LED_PIO |= 0x1; //set LSB
			for (i = 0; i < 100000; i++); //software delay
			*LED_PIO &= ~0x1; //clear LSB
		}
		return 1; //never gets here
}
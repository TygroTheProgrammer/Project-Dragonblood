		if (image_xscale == 1)
		{
	
		hsp += acc;
		if (hsp >= maxSpeed) hsp = maxSpeed;
	
		}
		else if (hsp > 0)
		{
		hsp -= acc;
		if (hsp <= 0) hsp = 0;
	
		}
		
		if (image_xscale == -1)
		{
	
			hsp -= acc;
			if (hsp <= -maxSpeed) hsp = -maxSpeed;
	
		}
		else if (hsp < 0)
		{
		hsp += acc;
		if (hsp >= 0) hsp = 0;
		}	
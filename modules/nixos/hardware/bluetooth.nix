{lib, ...}:
{
  hardware = {
  	bluetooth = {
  		enable = true;
		settings = {
			General.Experimental = true;
			General.FastConnectable = true;
			Policy.AutoEnable = true;
		};
  	};
  };
}

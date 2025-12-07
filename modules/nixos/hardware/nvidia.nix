{lib, config, ...}:
{
  hardware = {

	nvidia = {
  		modesetting.enable = false;
        	powerManagement.enable = false;
        	powerManagement.finegrained = false;
        	open = false;
        	nvidiaSettings = false;
        	package = config.boot.kernelPackages.nvidiaPackages.stable;
        	
        	prime = {
			offload.enable = true;
			offload.enableOffloadCmd = true;
        		intelBusId = "PCI:0:2:0";
        		nvidiaBusId = "PCI:1:0:0";
        	};

  	};



  };

}

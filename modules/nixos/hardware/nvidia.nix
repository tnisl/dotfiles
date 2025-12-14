{lib, config, ...}:
{
  hardware = {

	nvidia = {
  		modesetting.enable = true;
        	powerManagement.enable = true;
        	powerManagement.finegrained = true;
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

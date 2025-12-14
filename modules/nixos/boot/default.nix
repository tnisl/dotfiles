{lib, ...}:
{
	boot = {
		loader.systemd-boot.enable=false;

		loader.grub = {
    			enable = true;
    			
    			device = "nodev"; 
    			
    			efiSupport = true;
    			
    			# dual-boot
    			useOSProber = true;
    			
    			#snapshot limits
    			configurationLimit = 10;

		};

		loader.efi.canTouchEfiVariables = true;
		kernelParams = [
      "i915.enable_psr=2"
      "nvme_core.default_ps_max_latency_us=5500"
      "pcie_aspm=force"
      #"maxcpus=4"
    ];

	};


}

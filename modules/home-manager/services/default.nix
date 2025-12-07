{ pkgs, lib, ... }:

{
	# Gnome Keyring
  	services.gnome-keyring = {
		enable = true;
  	  	components = ["secrets" "ssh"];
  	};

  	# Mpris Proxy (Bluetooth media control)
  	systemd.user.services.mpris-proxy = {
		Unit = {
			Description = "Mpris proxy";
  	  	  	After = [ "network.target" "sound.target" ];
  	  	};
  	  	Service = {
			ExecStart = "${pkgs.bluez}/bin/mpris-proxy";
  	  	};
  	  	Install = {
			WantedBy = [ "default.target" ];
  	  	};
  	};


  systemd.user.services.swayosd = {
    Unit = {
      StartLimitIntervalSec = lib.mkForce 0;
      ConditionEnvironment = lib.mkForce [];
    };
  };
}

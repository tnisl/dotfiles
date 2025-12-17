{ pkgs, lib, ... }:

{
	# Gnome Keyring
  	services.gnome-keyring = {
		enable = true;
  	  	components = ["secrets" "ssh"];
  	};

    services.playerctld.enable = true;

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
}

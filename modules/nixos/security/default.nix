{pkgs, ...}:
{
  security = {
  	polkit.enable = true;
    pam.services.swaylock = {};
    wrappers = {
      btop = {
        owner = "root";
        group = "root";
        source = "${pkgs.btop}/bin/btop";
        capabilities = "cap_perfmon,cap_sys_ptrace,cap_sys_admin+ep";
      };
    };

  };


}

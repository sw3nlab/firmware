################################################################################
#
# vdec-openipc
#
################################################################################

VDEC_OPENIPC_SITE = https://github.com/openipc/silicon_research/archive
VDEC_OPENIPC_SOURCE = master.tar.gz
VDEC_OPENIPC_LICENSE = MIT

define VDEC_OPENIPC_BUILD_CMDS
	$(MAKE) CC=$(TARGET_CC) DRV=$(HISILICON_OSDRV_HI3536DV100_PKGDIR)/files/lib -C $(@D)/vdec
endef

define VDEC_OPENIPC_INSTALL_TARGET_CMDS
	$(INSTALL) -m 755 -d $(TARGET_DIR)/etc/init.d
	$(INSTALL) -m 755 -t $(TARGET_DIR)/etc/init.d $(VDEC_OPENIPC_PKGDIR)/files/S98vdec

	$(INSTALL) -m 755 -d $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 755 -t $(TARGET_DIR)/usr/bin $(@D)/vdec/vdec
endef

$(eval $(generic-package))

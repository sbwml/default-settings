#
# Copyright (C) 2016-2017 GitHub 
#
# This is free software, licensed under the GNU General Public License v3.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk

PKG_NAME:=default-settings
PKG_VERSION:=1.2
PKG_RELEASE:=1
PKG_LICENSE:=GPLv3
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/default-settings
  SECTION:=luci
  CATEGORY:=LuCI
  TITLE:=LuCI support for Default Settings
  PKGARCH:=all
  DEPENDS:= \
	+luci-base \
	+luci-lib-ip \
	+luci-lib-ipkg \
	+luci-lib-ipkg \
	+luci-lib-jsonc \
	+luci-lib-nixio \
	+luci-proto-ipv6 \
	+bash \
	+kmod-nft-fullcone \
	+zoneinfo-asia \
	+@LUCI_LANG_zh_Hans
endef

define Package/default-settings/description
	Default Settings & Language Support Packages.
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/default-settings/install
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./default/zzz-default-settings $(1)/etc/uci-defaults/zzz-default-settings
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/i18n
	po2lmo ./i18n/default.zh_Hans.po $(1)/usr/lib/lua/luci/i18n/default.zh-cn.lmo
endef

$(eval $(call BuildPackage,default-settings))

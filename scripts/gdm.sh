#!/bin/bash

source="/usr/share/gnome-shell/theme/Yaru/gnome-shell-theme.gresource"

color="#080808"

prefix="/org/gnome/shell/theme"
dest="/usr/local/share/gnome-shell/theme/focalgdm3"

install -D /dev/null $dest/gdm3.css
install -D /dev/null $dest/focalgdm3.gresource.xml
install -d $dest/icons/scalable/actions

gresource extract $source $prefix/gdm3.css > $dest/original.css
gresource extract $source $prefix/checkbox.svg > $dest/checkbox.svg
gresource extract $source $prefix/checkbox-off.svg > $dest/checkbox-off.svg
gresource extract $source $prefix/checkbox-focused.svg > $dest/checkbox-focused.svg
gresource extract $source $prefix/checkbox-off-focused.svg > $dest/checkbox-off-focused.svg
gresource extract $source $prefix/toggle-on.svg > $dest/toggle-on.svg
gresource extract $source $prefix/toggle-off.svg > $dest/toggle-off.svg
gresource extract $source $prefix/icons/scalable/actions/pointer-drag-symbolic.svg > $dest/icons/scalable/actions/pointer-drag-symbolic.svg
gresource extract $source $prefix/icons/scalable/actions/keyboard-enter-symbolic.svg > $dest/icons/scalable/actions/keyboard-enter-symbolic.svg
gresource extract $source $prefix/icons/scalable/actions/keyboard-hide-symbolic.svg > $dest/icons/scalable/actions/keyboard-hide-symbolic.svg
gresource extract $source $prefix/icons/scalable/actions/pointer-secondary-click-symbolic.svg > $dest/icons/scalable/actions/pointer-secondary-click-symbolic.svg
gresource extract $source $prefix/icons/scalable/actions/keyboard-shift-filled-symbolic.svg > $dest/icons/scalable/actions/keyboard-shift-filled-symbolic.svg
gresource extract $source $prefix/icons/scalable/actions/keyboard-caps-lock-filled-symbolic.svg > $dest/icons/scalable/actions/keyboard-caps-lock-filled-symbolic.svg
gresource extract $source $prefix/icons/scalable/actions/pointer-primary-click-symbolic.svg > $dest/icons/scalable/actions/pointer-primary-click-symbolic.svg
gresource extract $source $prefix/icons/scalable/actions/keyboard-layout-filled-symbolic.svg > $dest/icons/scalable/actions/keyboard-layout-filled-symbolic.svg
gresource extract $source $prefix/icons/scalable/actions/eye-not-looking-symbolic.svg > $dest/icons/scalable/actions/eye-not-looking-symbolic.svg
gresource extract $source $prefix/icons/scalable/actions/pointer-double-click-symbolic.svg > $dest/icons/scalable/actions/pointer-double-click-symbolic.svg
gresource extract $source $prefix/icons/scalable/actions/eye-open-negative-filled-symbolic.svg > $dest/icons/scalable/actions/eye-open-negative-filled-symbolic.svg

echo '@import url("resource:///org/gnome/shell/theme/original.css");
  #lockDialogGroup {
  background: '$color';
  background-repeat: no-repeat;
  background-size: cover;;
  background-position: center; }' > $dest/gdm3.css

echo '<?xml version="1.0" encoding="UTF-8"?>
<gresources>
  <gresource prefix="/org/gnome/shell/theme">
    <file>original.css</file>
    <file>gdm3.css</file>
    <file>toggle-off.svg</file>
    <file>checkbox-off.svg</file>
    <file>toggle-on.svg</file>
    <file>checkbox-off-focused.svg</file>
    <file>checkbox-focused.svg</file>
    <file>checkbox.svg</file>
    <file>icons/scalable/actions/pointer-drag-symbolic.svg</file>
    <file>icons/scalable/actions/keyboard-enter-symbolic.svg</file>
    <file>icons/scalable/actions/keyboard-hide-symbolic.svg</file>
    <file>icons/scalable/actions/pointer-secondary-click-symbolic.svg</file>
    <file>icons/scalable/actions/keyboard-shift-filled-symbolic.svg</file>
    <file>icons/scalable/actions/keyboard-caps-lock-filled-symbolic.svg</file>
    <file>icons/scalable/actions/pointer-primary-click-symbolic.svg</file>
    <file>icons/scalable/actions/keyboard-layout-filled-symbolic.svg</file>
    <file>icons/scalable/actions/eye-not-looking-symbolic.svg</file>
    <file>icons/scalable/actions/pointer-double-click-symbolic.svg</file>
    <file>icons/scalable/actions/eye-open-negative-filled-symbolic.svg</file>
  </gresource>
</gresources>' > $dest/focalgdm3.gresource.xml

cd $dest
glib-compile-resources focalgdm3.gresource.xml
mv focalgdm3.gresource ..
rm -r $dest
update-alternatives --quiet --install /usr/share/gnome-shell/gdm3-theme.gresource gdm3-theme.gresource /usr/local/share/gnome-shell/theme/focalgdm3.gresource 0
update-alternatives --quiet --set gdm3-theme.gresource /usr/local/share/gnome-shell/theme/focalgdm3.gresource
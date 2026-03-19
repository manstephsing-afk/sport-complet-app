<?xml version="1.0" encoding="utf-8"?>
<!--
  network_security_config.xml
  Autorise les appels HTTPS vers l'API Anthropic
  Copiez dans : android/app/src/main/res/xml/network_security_config.xml
-->
<network-security-config>
    <domain-config cleartextTrafficPermitted="false">
        <!-- API Anthropic Claude -->
        <domain includeSubdomains="true">api.anthropic.com</domain>
        <!-- Google Fonts -->
        <domain includeSubdomains="true">fonts.googleapis.com</domain>
        <domain includeSubdomains="true">fonts.gstatic.com</domain>
    </domain-config>

    <!-- Développement local uniquement -->
    <debug-overrides>
        <trust-anchors>
            <certificates src="system" />
            <certificates src="user" />
        </trust-anchors>
    </debug-overrides>
</network-security-config>

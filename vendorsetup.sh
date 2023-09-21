 #!/bin/bash 
  
 # Version / Maintainer infos 
  export OF_MAINTAINER="Norikhsan90" 
  export FOX_VERSION= "R12.1_0  (Android 13)"
  export FOX_BUILD_TYPE="Unoficial_Beta" 
  
  # OrangeFox Addons 
  export FOX_ENABLE_APP_MANAGER=1 
  export FOX_DELETE_AROMAFM=1 
  
  # MIUI & Custom ROMs 
  export OF_NO_MIUI_PATCH_WARNING=1 
  export OF_NO_TREBLE_COMPATIBILITY_CHECK=1 
  export OF_DONT_PATCH_ENCRYPTED_DEVICE=1 
  
  # Removes the loop block errors after flashing ZIPs (Workaround) 
  export OF_LOOP_DEVICE_ERRORS_TO_LOG=1 
  
  # Security (Disables MTP&ADB during password prompt) 
  export OF_ADVANCED_SECURITY=1 
  
  # Device info 
  export TARGET_DEVICE_ALT="ruby,rubypro" 
  
  # OTA / DM-Verity / Encryption 
  export OF_DISABLE_MIUI_OTA_BY_DEFAULT=1
  export OF_FIX_OTA_UPDATE_MANUAL_FLASH_ERROR=1 
  
  export OF_DONT_PATCH_ON_FRESH_INSTALLATION=1 
  export OF_DONT_PATCH_ENCRYPTED_DEVICE=1 
  export OF_KEEP_DM_VERITY_FORCED_ENCRYPTION=1
  export OF_SKIP_FBE_DECRYPTION_SDKVERSION=34 # Don't try to decrypt A14(?) 
  export OF_SKIP_DECRYPTED_ADOPTED_STORAGE=1 
  
  # Display / Leds 
  export OF_SCREEN_H="2400" 
  export OF_STATUS_H="100" 
  export OF_STATUS_INDENT_LEFT=48 
  export OF_STATUS_INDENT_RIGHT=48 
  export OF_HIDE_NOTCH=1 
  export OF_CLOCK_POS=1 # left and right clock positions available 
  export OF_USE_GREEN_LED=0 
  
  # Other OrangeFox configs 
  export OF_ENABLE_LPTOOLS=1 
  export OF_ALLOW_DISABLE_NAVBAR=0

  # Debugging 
  export FOX_RESET_SETTINGS=0 
  export FOX_INSTALLER_DEBUG_MODE=1

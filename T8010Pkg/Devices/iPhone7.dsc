[Defines]
  PLATFORM_NAME                  = T8010Pkg
  PLATFORM_GUID                  = 28f1a3bf-193a-47e3-a7b9-5a435eaab2ee
  PLATFORM_VERSION               = 0.1
  DSC_SPECIFICATION              = 0x00010019
  OUTPUT_DIRECTORY               = Build/$(PLATFORM_NAME)
  SUPPORTED_ARCHITECTURES        = AARCH64
  BUILD_TARGETS                  = DEBUG|RELEASE
  SKUID_IDENTIFIER               = DEFAULT
  FLASH_DEFINITION               = T8010Pkg/T8010Pkg.fdf

!include T8010Pkg/T8010Pkg.dsc

[PcdsFixedAtBuild.common]
  # System Memory (2GB?)
  gArmTokenSpaceGuid.PcdSystemMemoryBase|0x40000000
  gArmTokenSpaceGuid.PcdSystemMemorySize|0x80000000
  gEmbeddedTokenSpaceGuid.PcdPrePiStackBase|0x50201000
  gEmbeddedTokenSpaceGuid.PcdPrePiStackSize|0x00040000      # 256K stack
  gT8010PkgTokenSpaceGuid.PcdCpuVectorBaseAddress|0x50200000
  gT8010PkgTokenSpaceGuid.PcdUefiMemPoolBase|0x50241000         # DXE Heap base address
  gT8010PkgTokenSpaceGuid.PcdUefiMemPoolSize|0x07000000         # UefiMemorySize, DXE heap size

  # Framebuffer (720x1280)
  gT8010PkgTokenSpaceGuid.PcdMipiFrameBufferAddress|0x67000000
  gT8010PkgTokenSpaceGuid.PcdMipiFrameBufferWidth|1080
  gT8010PkgTokenSpaceGuid.PcdMipiFrameBufferHeight|1920
  gT8010PkgTokenSpaceGuid.PcdMipiFrameBufferVisibleWidth|1080
  gT8010PkgTokenSpaceGuid.PcdMipiFrameBufferVisibleHeight|1920

[PcdsDynamicDefault.common]
  gEfiMdeModulePkgTokenSpaceGuid.PcdVideoHorizontalResolution|1080 # /8 = column = 135
  gEfiMdeModulePkgTokenSpaceGuid.PcdVideoVerticalResolution|1920 #/19 = row = 101
  gEfiMdeModulePkgTokenSpaceGuid.PcdSetupVideoHorizontalResolution|1080
  gEfiMdeModulePkgTokenSpaceGuid.PcdSetupVideoVerticalResolution|1920
  gEfiMdeModulePkgTokenSpaceGuid.PcdSetupConOutColumn|135
  gEfiMdeModulePkgTokenSpaceGuid.PcdSetupConOutRow|101
  gEfiMdeModulePkgTokenSpaceGuid.PcdConOutColumn|135
  gEfiMdeModulePkgTokenSpaceGuid.PcdConOutRow|101
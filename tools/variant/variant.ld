MEMORY
{
    rom (rx)  : ORIGIN = 0x08010100, LENGTH = 0x0001FFFF-0x100
}

SECTIONS
{
    . = ORIGIN(rom);

    .variant_info : {
        KEEP(*(variant_info))
    } >rom

    .text : {
        *(.text*)    /* Program code */
        . = ALIGN(4);
        *(.rodata*)  /* Read-only data */
    } >rom

    /* variant "code" isn't allowed to have its own state */
    /DISCARD/ : {
        *(.bss)
        *(COMMON)
        *(.eh_frame)
        *(.data*)
    }
}

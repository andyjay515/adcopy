; Compiled with 1.32.263
--------------------------------------------------------------------
startup: ; startup
0801 : 0b __ __ INV
0802 : 08 __ __ PHP
0803 : 0a __ __ ASL
0804 : 00 __ __ BRK
0805 : 9e __ __ INV
0806 : 32 __ __ INV
0807 : 30 36 __ BMI $083f ; (startup + 62)
0809 : 31 00 __ AND ($00),y 
080b : 00 __ __ BRK
080c : 00 __ __ BRK
080d : ba __ __ TSX
080e : 8e 39 1c STX $1c39 ; (spentry + 0)
0811 : a2 1c __ LDX #$1c
0813 : a0 a3 __ LDY #$a3
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 1e __ CPX #$1e
081d : f0 0b __ BEQ $082a ; (startup + 41)
081f : 91 19 __ STA (IP + 0),y 
0821 : c8 __ __ INY
0822 : d0 fb __ BNE $081f ; (startup + 30)
0824 : e8 __ __ INX
0825 : d0 f2 __ BNE $0819 ; (startup + 24)
0827 : 91 19 __ STA (IP + 0),y 
0829 : c8 __ __ INY
082a : c0 00 __ CPY #$00
082c : d0 f9 __ BNE $0827 ; (startup + 38)
082e : a9 00 __ LDA #$00
0830 : a2 f7 __ LDX #$f7
0832 : d0 03 __ BNE $0837 ; (startup + 54)
0834 : 95 00 __ STA $00,x 
0836 : e8 __ __ INX
0837 : e0 f7 __ CPX #$f7
0839 : d0 f9 __ BNE $0834 ; (startup + 51)
083b : a9 50 __ LDA #$50
083d : 85 23 __ STA SP + 0 
083f : a9 9f __ LDA #$9f
0841 : 85 24 __ STA SP + 1 
0843 : 20 80 08 JSR $0880 ; (main.s1 + 0)
0846 : a9 4c __ LDA #$4c
0848 : 85 54 __ STA $54 
084a : a9 00 __ LDA #$00
084c : 85 13 __ STA P6 
084e : a9 19 __ LDA #$19
0850 : 85 16 __ STA P9 
0852 : 60 __ __ RTS
--------------------------------------------------------------------
main: ; main()->i16
.s1:
0880 : a5 53 __ LDA T3 + 0 
0882 : 8d 52 9f STA $9f52 ; (main@stack + 0)
0885 : a5 54 __ LDA T4 + 0 
0887 : 8d 53 9f STA $9f53 ; (main@stack + 1)
088a : a5 55 __ LDA T5 + 0 
088c : 8d 54 9f STA $9f54 ; (main@stack + 2)
.s4:
088f : 20 3f 0b JSR $0b3f ; (fillSectorsInfo.s4 + 0)
0892 : a9 08 __ LDA #$08
0894 : 85 53 __ STA T3 + 0 
0896 : a9 09 __ LDA #$09
0898 : 85 54 __ STA T4 + 0 
.l5:
089a : a9 93 __ LDA #$93
089c : 20 68 0b JSR $0b68 ; (putpch.s4 + 0)
089f : a9 0e __ LDA #$0e
08a1 : 20 68 0b JSR $0b68 ; (putpch.s4 + 0)
08a4 : 20 cb 0b JSR $0bcb ; (setDarkTheme.s4 + 0)
08a7 : a9 0a __ LDA #$0a
08a9 : 85 0d __ STA P0 
08ab : a9 0c __ LDA #$0c
08ad : 85 10 __ STA P3 
08af : a9 05 __ LDA #$05
08b1 : 85 0e __ STA P1 
08b3 : a9 7f __ LDA #$7f
08b5 : 85 0f __ STA P2 
08b7 : 20 39 0c JSR $0c39 ; (putsxy.s4 + 0)
08ba : a9 17 __ LDA #$17
08bc : 85 0e __ STA P1 
08be : a9 0c __ LDA #$0c
08c0 : 85 10 __ STA P3 
08c2 : a9 91 __ LDA #$91
08c4 : 85 0f __ STA P2 
08c6 : 20 39 0c JSR $0c39 ; (putsxy.s4 + 0)
08c9 : a9 08 __ LDA #$08
08cb : 85 11 __ STA P4 
08cd : a9 07 __ LDA #$07
08cf : 85 12 __ STA P5 
08d1 : 20 a3 0c JSR $0ca3 ; (keyb_poll.s4 + 0)
08d4 : 20 54 0d JSR $0d54 ; (drawBox.s4 + 0)
08d7 : a9 0d __ LDA #$0d
08d9 : 85 12 __ STA P5 
08db : 20 54 0d JSR $0d54 ; (drawBox.s4 + 0)
08de : a9 57 __ LDA #$57
08e0 : 85 0d __ STA P0 
08e2 : a9 0d __ LDA #$0d
08e4 : 85 10 __ STA P3 
08e6 : a9 9f __ LDA #$9f
08e8 : 85 0e __ STA P1 
08ea : a9 ca __ LDA #$ca
08ec : 85 0f __ STA P2 
08ee : 20 ab 0d JSR $0dab ; (set_sstr.s4 + 0)
08f1 : a5 53 __ LDA T3 + 0 
08f3 : 85 15 __ STA P8 
08f5 : a9 57 __ LDA #$57
08f7 : 85 13 __ STA P6 
08f9 : a9 9f __ LDA #$9f
08fb : 85 14 __ STA P7 
08fd : a9 00 __ LDA #$00
08ff : 85 55 __ STA T5 + 0 
0901 : 85 16 __ STA P9 
0903 : 20 ce 0d JSR $0dce ; (append_sstr_num.s4 + 0)
0906 : a9 10 __ LDA #$10
0908 : 85 0d __ STA P0 
090a : a9 9f __ LDA #$9f
090c : 85 10 __ STA P3 
090e : a9 0b __ LDA #$0b
0910 : 85 0e __ STA P1 
0912 : a9 58 __ LDA #$58
0914 : 85 0f __ STA P2 
0916 : 20 39 0c JSR $0c39 ; (putsxy.s4 + 0)
0919 : a9 57 __ LDA #$57
091b : 85 0d __ STA P0 
091d : a9 0e __ LDA #$0e
091f : 85 10 __ STA P3 
0921 : a9 9f __ LDA #$9f
0923 : 85 0e __ STA P1 
0925 : a9 ca __ LDA #$ca
0927 : 85 0f __ STA P2 
0929 : 20 ab 0d JSR $0dab ; (set_sstr.s4 + 0)
092c : a5 54 __ LDA T4 + 0 
092e : 85 15 __ STA P8 
0930 : 20 ce 0d JSR $0dce ; (append_sstr_num.s4 + 0)
0933 : a9 10 __ LDA #$10
0935 : 85 0d __ STA P0 
0937 : a9 9f __ LDA #$9f
0939 : 85 10 __ STA P3 
093b : a9 11 __ LDA #$11
093d : 85 0e __ STA P1 
093f : a9 58 __ LDA #$58
0941 : 85 0f __ STA P2 
0943 : 20 39 0c JSR $0c39 ; (putsxy.s4 + 0)
0946 : a9 0c __ LDA #$0c
0948 : 85 0d __ STA P0 
094a : a9 0e __ LDA #$0e
094c : 85 10 __ STA P3 
094e : a9 14 __ LDA #$14
0950 : 85 0e __ STA P1 
0952 : a9 cf __ LDA #$cf
0954 : 85 0f __ STA P2 
0956 : 20 39 0c JSR $0c39 ; (putsxy.s4 + 0)
.l6:
0959 : 20 db 0e JSR $0edb ; (getch.l4 + 0)
095c : c9 59 __ CMP #$59
095e : d0 71 __ BNE $09d1 ; (main.s7 + 0)
.s29:
0960 : a9 57 __ LDA #$57
0962 : 85 0d __ STA P0 
0964 : a9 0d __ LDA #$0d
0966 : 85 10 __ STA P3 
0968 : a9 9f __ LDA #$9f
096a : 85 0e __ STA P1 
096c : a9 ca __ LDA #$ca
096e : 85 0f __ STA P2 
0970 : 20 ab 0d JSR $0dab ; (set_sstr.s4 + 0)
0973 : a5 54 __ LDA T4 + 0 
0975 : 85 15 __ STA P8 
0977 : a9 57 __ LDA #$57
0979 : 85 13 __ STA P6 
097b : a9 9f __ LDA #$9f
097d : 85 14 __ STA P7 
097f : a9 00 __ LDA #$00
0981 : 85 16 __ STA P9 
0983 : 20 ce 0d JSR $0dce ; (append_sstr_num.s4 + 0)
0986 : a9 10 __ LDA #$10
0988 : 85 0d __ STA P0 
098a : a9 9f __ LDA #$9f
098c : 85 10 __ STA P3 
098e : a9 0b __ LDA #$0b
0990 : 85 0e __ STA P1 
0992 : a9 58 __ LDA #$58
0994 : 85 0f __ STA P2 
0996 : 20 39 0c JSR $0c39 ; (putsxy.s4 + 0)
0999 : a9 57 __ LDA #$57
099b : 85 0d __ STA P0 
099d : a9 0e __ LDA #$0e
099f : 85 10 __ STA P3 
09a1 : a9 9f __ LDA #$9f
09a3 : 85 0e __ STA P1 
09a5 : a9 ca __ LDA #$ca
09a7 : 85 0f __ STA P2 
09a9 : 20 ab 0d JSR $0dab ; (set_sstr.s4 + 0)
09ac : a5 53 __ LDA T3 + 0 
09ae : 85 15 __ STA P8 
09b0 : 20 ce 0d JSR $0dce ; (append_sstr_num.s4 + 0)
09b3 : a9 10 __ LDA #$10
09b5 : 85 0d __ STA P0 
09b7 : a9 9f __ LDA #$9f
09b9 : 85 10 __ STA P3 
09bb : a9 11 __ LDA #$11
09bd : 85 0e __ STA P1 
09bf : a9 58 __ LDA #$58
09c1 : 85 0f __ STA P2 
09c3 : 20 39 0c JSR $0c39 ; (putsxy.s4 + 0)
09c6 : a5 54 __ LDA T4 + 0 
09c8 : 85 53 __ STA T3 + 0 
09ca : a5 15 __ LDA P8 
09cc : 85 54 __ STA T4 + 0 
09ce : 4c 59 09 JMP $0959 ; (main.l6 + 0)
.s7:
09d1 : c9 4e __ CMP #$4e
09d3 : f0 1d __ BEQ $09f2 ; (main.s10 + 0)
.s8:
09d5 : c9 51 __ CMP #$51
09d7 : d0 80 __ BNE $0959 ; (main.l6 + 0)
.s9:
09d9 : 20 19 0f JSR $0f19 ; (resetCPU.s4 + 0)
09dc : a9 00 __ LDA #$00
09de : 85 1b __ STA ACCU + 0 
09e0 : 85 1c __ STA ACCU + 1 
.s3:
09e2 : ad 52 9f LDA $9f52 ; (main@stack + 0)
09e5 : 85 53 __ STA T3 + 0 
09e7 : ad 53 9f LDA $9f53 ; (main@stack + 1)
09ea : 85 54 __ STA T4 + 0 
09ec : ad 54 9f LDA $9f54 ; (main@stack + 2)
09ef : 85 55 __ STA T5 + 0 
09f1 : 60 __ __ RTS
.s10:
09f2 : a5 53 __ LDA T3 + 0 
09f4 : 85 13 __ STA P6 
09f6 : 20 1d 0f JSR $0f1d ; (getDriveInfo.s4 + 0)
09f9 : a5 1c __ LDA ACCU + 1 
09fb : 30 06 __ BMI $0a03 ; (main.s11 + 0)
.s28:
09fd : 85 52 __ STA T1 + 1 
09ff : 05 1b __ ORA ACCU + 0 
0a01 : d0 07 __ BNE $0a0a ; (main.s27 + 0)
.s11:
0a03 : a9 11 __ LDA #$11
0a05 : a0 9c __ LDY #$9c
0a07 : 4c 38 0a JMP $0a38 ; (main.s12 + 0)
.s27:
0a0a : a5 1b __ LDA ACCU + 0 
0a0c : 85 51 __ STA T1 + 0 
0a0e : a9 57 __ LDA #$57
0a10 : 85 0d __ STA P0 
0a12 : a9 0f __ LDA #$0f
0a14 : 85 10 __ STA P3 
0a16 : a9 9f __ LDA #$9f
0a18 : 85 0e __ STA P1 
0a1a : a9 af __ LDA #$af
0a1c : 85 0f __ STA P2 
0a1e : 20 ab 0d JSR $0dab ; (set_sstr.s4 + 0)
0a21 : a5 51 __ LDA T1 + 0 
0a23 : 85 15 __ STA P8 
0a25 : a9 57 __ LDA #$57
0a27 : 85 13 __ STA P6 
0a29 : a9 9f __ LDA #$9f
0a2b : 85 14 __ STA P7 
0a2d : a5 52 __ LDA T1 + 1 
0a2f : 85 16 __ STA P9 
0a31 : 20 ce 0d JSR $0dce ; (append_sstr_num.s4 + 0)
0a34 : a9 9f __ LDA #$9f
0a36 : a0 58 __ LDY #$58
.s12:
0a38 : 84 0f __ STY P2 
0a3a : 85 10 __ STA P3 
0a3c : a9 10 __ LDA #$10
0a3e : 85 0d __ STA P0 
0a40 : a9 07 __ LDA #$07
0a42 : 85 0e __ STA P1 
0a44 : 20 39 0c JSR $0c39 ; (putsxy.s4 + 0)
0a47 : a5 54 __ LDA T4 + 0 
0a49 : 85 13 __ STA P6 
0a4b : 20 1d 0f JSR $0f1d ; (getDriveInfo.s4 + 0)
0a4e : a5 1c __ LDA ACCU + 1 
0a50 : 30 06 __ BMI $0a58 ; (main.s13 + 0)
.s26:
0a52 : 85 52 __ STA T1 + 1 
0a54 : 05 1b __ ORA ACCU + 0 
0a56 : d0 07 __ BNE $0a5f ; (main.s25 + 0)
.s13:
0a58 : a9 11 __ LDA #$11
0a5a : a0 9c __ LDY #$9c
0a5c : 4c 8d 0a JMP $0a8d ; (main.s14 + 0)
.s25:
0a5f : a5 1b __ LDA ACCU + 0 
0a61 : 85 51 __ STA T1 + 0 
0a63 : a9 57 __ LDA #$57
0a65 : 85 0d __ STA P0 
0a67 : a9 0f __ LDA #$0f
0a69 : 85 10 __ STA P3 
0a6b : a9 9f __ LDA #$9f
0a6d : 85 0e __ STA P1 
0a6f : a9 af __ LDA #$af
0a71 : 85 0f __ STA P2 
0a73 : 20 ab 0d JSR $0dab ; (set_sstr.s4 + 0)
0a76 : a5 51 __ LDA T1 + 0 
0a78 : 85 15 __ STA P8 
0a7a : a9 57 __ LDA #$57
0a7c : 85 13 __ STA P6 
0a7e : a9 9f __ LDA #$9f
0a80 : 85 14 __ STA P7 
0a82 : a5 52 __ LDA T1 + 1 
0a84 : 85 16 __ STA P9 
0a86 : 20 ce 0d JSR $0dce ; (append_sstr_num.s4 + 0)
0a89 : a9 9f __ LDA #$9f
0a8b : a0 58 __ LDY #$58
.s14:
0a8d : 84 0f __ STY P2 
0a8f : 85 10 __ STA P3 
0a91 : a9 10 __ LDA #$10
0a93 : 85 0d __ STA P0 
0a95 : a9 0d __ LDA #$0d
0a97 : 85 0e __ STA P1 
0a99 : 20 39 0c JSR $0c39 ; (putsxy.s4 + 0)
0a9c : a9 0a __ LDA #$0a
0a9e : 85 0d __ STA P0 
0aa0 : a9 11 __ LDA #$11
0aa2 : 85 10 __ STA P3 
0aa4 : a9 14 __ LDA #$14
0aa6 : 85 0e __ STA P1 
0aa8 : a9 9e __ LDA #$9e
0aaa : 85 0f __ STA P2 
0aac : 20 39 0c JSR $0c39 ; (putsxy.s4 + 0)
0aaf : e6 0e __ INC P1 
0ab1 : a9 b8 __ LDA #$b8
0ab3 : 85 0f __ STA P2 
0ab5 : a9 11 __ LDA #$11
0ab7 : 85 10 __ STA P3 
0ab9 : 20 39 0c JSR $0c39 ; (putsxy.s4 + 0)
0abc : e6 0e __ INC P1 
0abe : a9 d3 __ LDA #$d3
0ac0 : 85 0f __ STA P2 
0ac2 : a9 11 __ LDA #$11
0ac4 : 85 10 __ STA P3 
0ac6 : 20 39 0c JSR $0c39 ; (putsxy.s4 + 0)
.l15:
0ac9 : 20 db 0e JSR $0edb ; (getch.l4 + 0)
0acc : c9 43 __ CMP #$43
0ace : f0 0d __ BEQ $0add ; (main.s19 + 0)
.s16:
0ad0 : c9 4f __ CMP #$4f
0ad2 : f0 07 __ BEQ $0adb ; (main.s18 + 0)
.s17:
0ad4 : c9 51 __ CMP #$51
0ad6 : d0 f1 __ BNE $0ac9 ; (main.l15 + 0)
0ad8 : 4c d9 09 JMP $09d9 ; (main.s9 + 0)
.s18:
0adb : e6 55 __ INC T5 + 0 
.s19:
0add : a9 93 __ LDA #$93
0adf : 20 68 0b JSR $0b68 ; (putpch.s4 + 0)
0ae2 : 20 e0 11 JSR $11e0 ; (printTrackNumbers.s4 + 0)
0ae5 : 20 79 12 JSR $1279 ; (printSectorNumbers.s4 + 0)
0ae8 : 20 bf 12 JSR $12bf ; (printLegend.s4 + 0)
0aeb : a9 0a __ LDA #$0a
0aed : 85 0d __ STA P0 
0aef : a9 13 __ LDA #$13
0af1 : 85 10 __ STA P3 
0af3 : a9 00 __ LDA #$00
0af5 : 85 0e __ STA P1 
0af7 : a9 1c __ LDA #$1c
0af9 : 85 0f __ STA P2 
0afb : 20 39 0c JSR $0c39 ; (putsxy.s4 + 0)
0afe : a5 53 __ LDA T3 + 0 
0b00 : 8d fd 9f STA $9ffd ; (sstack + 7)
0b03 : a5 54 __ LDA T4 + 0 
0b05 : 8d fe 9f STA $9ffe ; (sstack + 8)
0b08 : a5 55 __ LDA T5 + 0 
0b0a : 8d ff 9f STA $9fff ; (sstack + 9)
0b0d : 20 35 13 JSR $1335 ; (copyDisk.s4 + 0)
0b10 : a9 0a __ LDA #$0a
0b12 : 85 0d __ STA P0 
0b14 : a9 00 __ LDA #$00
0b16 : 85 0e __ STA P1 
0b18 : 24 1c __ BIT ACCU + 1 
0b1a : 10 07 __ BPL $0b23 ; (main.s24 + 0)
.s20:
0b1c : a9 1b __ LDA #$1b
0b1e : a0 95 __ LDY #$95
0b20 : 4c 27 0b JMP $0b27 ; (main.s21 + 0)
.s24:
0b23 : a9 1b __ LDA #$1b
0b25 : a0 76 __ LDY #$76
.s21:
0b27 : 84 0f __ STY P2 
0b29 : 85 10 __ STA P3 
0b2b : 20 39 0c JSR $0c39 ; (putsxy.s4 + 0)
.l22:
0b2e : 20 db 0e JSR $0edb ; (getch.l4 + 0)
0b31 : c9 43 __ CMP #$43
0b33 : d0 03 __ BNE $0b38 ; (main.s23 + 0)
0b35 : 4c 9a 08 JMP $089a ; (main.l5 + 0)
.s23:
0b38 : c9 51 __ CMP #$51
0b3a : d0 f2 __ BNE $0b2e ; (main.l22 + 0)
0b3c : 4c d9 09 JMP $09d9 ; (main.s9 + 0)
--------------------------------------------------------------------
fillSectorsInfo: ; fillSectorsInfo()->void
.s4:
0b3f : a9 15 __ LDA #$15
0b41 : a2 10 __ LDX #$10
.l8:
0b43 : 9d a3 1c STA $1ca3,x ; (sectors + 0)
0b46 : ca __ __ DEX
0b47 : 10 fa __ BPL $0b43 ; (fillSectorsInfo.l8 + 0)
.s5:
0b49 : a9 13 __ LDA #$13
0b4b : a2 06 __ LDX #$06
.l9:
0b4d : 9d b4 1c STA $1cb4,x ; (sectors + 17)
0b50 : ca __ __ DEX
0b51 : 10 fa __ BPL $0b4d ; (fillSectorsInfo.l9 + 0)
.s6:
0b53 : a9 12 __ LDA #$12
0b55 : a2 05 __ LDX #$05
.l10:
0b57 : 9d bb 1c STA $1cbb,x ; (sectors + 24)
0b5a : ca __ __ DEX
0b5b : 10 fa __ BPL $0b57 ; (fillSectorsInfo.l10 + 0)
.s7:
0b5d : a9 11 __ LDA #$11
0b5f : a2 04 __ LDX #$04
.l11:
0b61 : 9d c1 1c STA $1cc1,x ; (sectors + 30)
0b64 : ca __ __ DEX
0b65 : 10 fa __ BPL $0b61 ; (fillSectorsInfo.l11 + 0)
.s3:
0b67 : 60 __ __ RTS
--------------------------------------------------------------------
putpch: ; putpch(u8)->void
.s4:
0b68 : 85 0d __ STA P0 ; (c + 0)
0b6a : ad 3a 1c LDA $1c3a ; (giocharmap + 0)
0b6d : f0 32 __ BEQ $0ba1 ; (putpch.s5 + 0)
.s6:
0b6f : a5 0d __ LDA P0 ; (c + 0)
0b71 : c9 0a __ CMP #$0a
0b73 : d0 04 __ BNE $0b79 ; (putpch.s7 + 0)
.s18:
0b75 : a9 0d __ LDA #$0d
0b77 : d0 32 __ BNE $0bab ; (putpch.s15 + 0)
.s7:
0b79 : c9 09 __ CMP #$09
0b7b : f0 36 __ BEQ $0bb3 ; (putpch.s16 + 0)
.s8:
0b7d : ad 3a 1c LDA $1c3a ; (giocharmap + 0)
0b80 : c9 02 __ CMP #$02
0b82 : 90 1d __ BCC $0ba1 ; (putpch.s5 + 0)
.s9:
0b84 : a5 0d __ LDA P0 ; (c + 0)
0b86 : c9 41 __ CMP #$41
0b88 : 90 17 __ BCC $0ba1 ; (putpch.s5 + 0)
.s10:
0b8a : c9 7b __ CMP #$7b
0b8c : b0 13 __ BCS $0ba1 ; (putpch.s5 + 0)
.s11:
0b8e : c9 61 __ CMP #$61
0b90 : b0 04 __ BCS $0b96 ; (putpch.s13 + 0)
.s12:
0b92 : c9 5b __ CMP #$5b
0b94 : b0 0b __ BCS $0ba1 ; (putpch.s5 + 0)
.s13:
0b96 : 49 20 __ EOR #$20
0b98 : 85 0d __ STA P0 ; (c + 0)
0b9a : ad 3a 1c LDA $1c3a ; (giocharmap + 0)
0b9d : c9 02 __ CMP #$02
0b9f : f0 06 __ BEQ $0ba7 ; (putpch.s14 + 0)
.s5:
0ba1 : a5 0d __ LDA P0 ; (c + 0)
0ba3 : 20 d2 ff JSR $ffd2 
.s3:
0ba6 : 60 __ __ RTS
.s14:
0ba7 : a5 0d __ LDA P0 ; (c + 0)
0ba9 : 29 5f __ AND #$5f
.s15:
0bab : 85 43 __ STA T0 + 0 
0bad : a5 43 __ LDA T0 + 0 
0baf : 20 d2 ff JSR $ffd2 
0bb2 : 60 __ __ RTS
.s16:
0bb3 : a5 d3 __ LDA $d3 
0bb5 : 29 03 __ AND #$03
0bb7 : 85 43 __ STA T0 + 0 
0bb9 : a9 20 __ LDA #$20
0bbb : 85 44 __ STA T1 + 0 
.l17:
0bbd : a5 44 __ LDA T1 + 0 
0bbf : 20 d2 ff JSR $ffd2 
0bc2 : e6 43 __ INC T0 + 0 
0bc4 : a5 43 __ LDA T0 + 0 
0bc6 : c9 04 __ CMP #$04
0bc8 : 90 f3 __ BCC $0bbd ; (putpch.l17 + 0)
0bca : 60 __ __ RTS
--------------------------------------------------------------------
setDarkTheme: ; setDarkTheme()->void
.s4:
0bcb : a9 00 __ LDA #$00
0bcd : 8d 21 d0 STA $d021 
0bd0 : 85 1b __ STA ACCU + 0 
0bd2 : a9 0b __ LDA #$0b
0bd4 : 8d 20 d0 STA $d020 
0bd7 : a9 d8 __ LDA #$d8
0bd9 : 85 1c __ STA ACCU + 1 
.l5:
0bdb : a9 0f __ LDA #$0f
0bdd : a0 00 __ LDY #$00
0bdf : 91 1b __ STA (ACCU + 0),y 
0be1 : e6 1b __ INC ACCU + 0 
0be3 : d0 02 __ BNE $0be7 ; (setDarkTheme.s9 + 0)
.s8:
0be5 : e6 1c __ INC ACCU + 1 
.s9:
0be7 : a5 1c __ LDA ACCU + 1 
0be9 : c9 db __ CMP #$db
0beb : 90 ee __ BCC $0bdb ; (setDarkTheme.l5 + 0)
.s10:
0bed : d0 06 __ BNE $0bf5 ; (setDarkTheme.s6 + 0)
.s7:
0bef : a5 1b __ LDA ACCU + 0 
0bf1 : c9 e8 __ CMP #$e8
0bf3 : 90 e6 __ BCC $0bdb ; (setDarkTheme.l5 + 0)
.s6:
0bf5 : 4c f8 0b JMP $0bf8 ; (setColorInfo.s4 + 0)
--------------------------------------------------------------------
setColorInfo: ; setColorInfo()->void
.s4:
0bf8 : a9 82 __ LDA #$82
0bfa : 85 1b __ STA ACCU + 0 
0bfc : a9 d8 __ LDA #$d8
0bfe : 85 1c __ STA ACCU + 1 
.l5:
0c00 : a9 04 __ LDA #$04
0c02 : a0 00 __ LDY #$00
0c04 : 91 1b __ STA (ACCU + 0),y 
0c06 : e6 1b __ INC ACCU + 0 
0c08 : d0 02 __ BNE $0c0c ; (setColorInfo.s11 + 0)
.s10:
0c0a : e6 1c __ INC ACCU + 1 
.s11:
0c0c : a5 1c __ LDA ACCU + 1 
0c0e : c9 d8 __ CMP #$d8
0c10 : 90 ee __ BCC $0c00 ; (setColorInfo.l5 + 0)
.s14:
0c12 : d0 06 __ BNE $0c1a ; (setColorInfo.s6 + 0)
.s9:
0c14 : a5 1b __ LDA ACCU + 0 
0c16 : c9 92 __ CMP #$92
0c18 : 90 e6 __ BCC $0c00 ; (setColorInfo.l5 + 0)
.s6:
0c1a : 84 1b __ STY ACCU + 0 
0c1c : a9 d8 __ LDA #$d8
0c1e : 85 1c __ STA ACCU + 1 
.l7:
0c20 : a9 0f __ LDA #$0f
0c22 : 91 1b __ STA (ACCU + 0),y 
0c24 : e6 1b __ INC ACCU + 0 
0c26 : d0 02 __ BNE $0c2a ; (setColorInfo.s13 + 0)
.s12:
0c28 : e6 1c __ INC ACCU + 1 
.s13:
0c2a : a5 1c __ LDA ACCU + 1 
0c2c : c9 d8 __ CMP #$d8
0c2e : 90 f0 __ BCC $0c20 ; (setColorInfo.l7 + 0)
.s15:
0c30 : d0 06 __ BNE $0c38 ; (setColorInfo.s3 + 0)
.s8:
0c32 : a5 1b __ LDA ACCU + 0 
0c34 : c9 28 __ CMP #$28
0c36 : 90 e8 __ BCC $0c20 ; (setColorInfo.l7 + 0)
.s3:
0c38 : 60 __ __ RTS
--------------------------------------------------------------------
putsxy: ; putsxy(u8,u8,const u8*)->void
.s4:
0c39 : a0 00 __ LDY #$00
0c3b : b1 0f __ LDA (P2),y ; (s + 0)
0c3d : f0 3f __ BEQ $0c7e ; (putsxy.s3 + 0)
.s5:
0c3f : a5 0e __ LDA P1 ; (y + 0)
0c41 : 0a __ __ ASL
0c42 : 85 1b __ STA ACCU + 0 
0c44 : 98 __ __ TYA
0c45 : 2a __ __ ROL
0c46 : 06 1b __ ASL ACCU + 0 
0c48 : 2a __ __ ROL
0c49 : aa __ __ TAX
0c4a : 18 __ __ CLC
0c4b : a5 1b __ LDA ACCU + 0 
0c4d : 65 0e __ ADC P1 ; (y + 0)
0c4f : 85 1b __ STA ACCU + 0 
0c51 : 8a __ __ TXA
0c52 : 69 00 __ ADC #$00
0c54 : 06 1b __ ASL ACCU + 0 
0c56 : 2a __ __ ROL
0c57 : 06 1b __ ASL ACCU + 0 
0c59 : 2a __ __ ROL
0c5a : 06 1b __ ASL ACCU + 0 
0c5c : 2a __ __ ROL
0c5d : aa __ __ TAX
0c5e : 18 __ __ CLC
0c5f : a5 1b __ LDA ACCU + 0 
0c61 : 65 0d __ ADC P0 ; (x + 0)
0c63 : 85 1b __ STA ACCU + 0 
0c65 : 8a __ __ TXA
0c66 : 69 04 __ ADC #$04
0c68 : 85 1c __ STA ACCU + 1 
0c6a : b1 0f __ LDA (P2),y ; (s + 0)
.l6:
0c6c : 91 1b __ STA (ACCU + 0),y 
0c6e : e6 1b __ INC ACCU + 0 
0c70 : d0 02 __ BNE $0c74 ; (putsxy.s8 + 0)
.s7:
0c72 : e6 1c __ INC ACCU + 1 
.s8:
0c74 : e6 0f __ INC P2 ; (s + 0)
0c76 : d0 02 __ BNE $0c7a ; (putsxy.s10 + 0)
.s9:
0c78 : e6 10 __ INC P3 ; (s + 1)
.s10:
0c7a : b1 0f __ LDA (P2),y ; (s + 0)
0c7c : d0 ee __ BNE $0c6c ; (putsxy.l6 + 0)
.s3:
0c7e : 60 __ __ RTS
--------------------------------------------------------------------
0c7f : __ __ __ BYT c1 4e 4f 54 48 45 52 20 c4 49 53 4b 20 c3 4f 50 : .NOTHER .ISK .OP
0c8f : __ __ __ BYT 59 00                                           : Y.
--------------------------------------------------------------------
0c91 : __ __ __ BYT c1 4e 44 59 20 ca 41 59 20 32 30 32 35 31 30 2e : .NDY .AY 202510.
0ca1 : __ __ __ BYT 31 00                                           : 1.
--------------------------------------------------------------------
keyb_poll: ; keyb_poll()->void
.s4:
0ca3 : a9 ff __ LDA #$ff
0ca5 : 8d 02 dc STA $dc02 
0ca8 : 8d 00 dc STA $dc00 
0cab : a9 00 __ LDA #$00
0cad : 8d c6 1c STA $1cc6 ; (keyb_key + 0)
0cb0 : ae 01 dc LDX $dc01 
0cb3 : e8 __ __ INX
0cb4 : d0 25 __ BNE $0cdb ; (keyb_poll.s3 + 0)
.s5:
0cb6 : 8d 03 dc STA $dc03 
0cb9 : 8d 00 dc STA $dc00 
0cbc : ad 01 dc LDA $dc01 
0cbf : c9 ff __ CMP #$ff
0cc1 : d0 1f __ BNE $0ce2 ; (keyb_poll.s7 + 0)
.s6:
0cc3 : 8d c7 1c STA $1cc7 ; (keyb_matrix + 0)
0cc6 : 8d c8 1c STA $1cc8 ; (keyb_matrix + 1)
0cc9 : 8d c9 1c STA $1cc9 ; (keyb_matrix + 2)
0ccc : 8d ca 1c STA $1cca ; (keyb_matrix + 3)
0ccf : 8d cb 1c STA $1ccb ; (keyb_matrix + 4)
0cd2 : 8d cc 1c STA $1ccc ; (keyb_matrix + 5)
0cd5 : 8d cd 1c STA $1ccd ; (keyb_matrix + 6)
0cd8 : 8d ce 1c STA $1cce ; (keyb_matrix + 7)
.s3:
0cdb : ad cf 1c LDA $1ccf ; (ciaa_pra_def + 0)
0cde : 8d 00 dc STA $dc00 
0ce1 : 60 __ __ RTS
.s7:
0ce2 : ad cd 1c LDA $1ccd ; (keyb_matrix + 6)
0ce5 : 29 ef __ AND #$ef
0ce7 : 8d cd 1c STA $1ccd ; (keyb_matrix + 6)
0cea : ad c8 1c LDA $1cc8 ; (keyb_matrix + 1)
0ced : 29 7f __ AND #$7f
0cef : 8d c8 1c STA $1cc8 ; (keyb_matrix + 1)
0cf2 : a9 fe __ LDA #$fe
0cf4 : 85 1b __ STA ACCU + 0 
.l20:
0cf6 : a5 1b __ LDA ACCU + 0 
0cf8 : 8d 00 dc STA $dc00 
0cfb : bd c7 1c LDA $1cc7,x ; (keyb_matrix + 0)
0cfe : 85 1c __ STA ACCU + 1 
0d00 : ad 01 dc LDA $dc01 
0d03 : 9d c7 1c STA $1cc7,x ; (keyb_matrix + 0)
0d06 : 49 ff __ EOR #$ff
0d08 : 38 __ __ SEC
0d09 : 26 1b __ ROL ACCU + 0 
0d0b : 25 1c __ AND ACCU + 1 
0d0d : f0 25 __ BEQ $0d34 ; (keyb_poll.s8 + 0)
.s13:
0d0f : 85 1c __ STA ACCU + 1 
0d11 : 8a __ __ TXA
0d12 : 0a __ __ ASL
0d13 : 0a __ __ ASL
0d14 : 0a __ __ ASL
0d15 : 09 80 __ ORA #$80
0d17 : a8 __ __ TAY
0d18 : a5 1c __ LDA ACCU + 1 
0d1a : 29 f0 __ AND #$f0
0d1c : f0 04 __ BEQ $0d22 ; (keyb_poll.s14 + 0)
.s19:
0d1e : 98 __ __ TYA
0d1f : 09 04 __ ORA #$04
0d21 : a8 __ __ TAY
.s14:
0d22 : a5 1c __ LDA ACCU + 1 
0d24 : 29 cc __ AND #$cc
0d26 : f0 02 __ BEQ $0d2a ; (keyb_poll.s15 + 0)
.s18:
0d28 : c8 __ __ INY
0d29 : c8 __ __ INY
.s15:
0d2a : a5 1c __ LDA ACCU + 1 
0d2c : 29 aa __ AND #$aa
0d2e : f0 01 __ BEQ $0d31 ; (keyb_poll.s16 + 0)
.s17:
0d30 : c8 __ __ INY
.s16:
0d31 : 8c c6 1c STY $1cc6 ; (keyb_key + 0)
.s8:
0d34 : e8 __ __ INX
0d35 : e0 08 __ CPX #$08
0d37 : 90 bd __ BCC $0cf6 ; (keyb_poll.l20 + 0)
.s9:
0d39 : ad c6 1c LDA $1cc6 ; (keyb_key + 0)
0d3c : f0 9d __ BEQ $0cdb ; (keyb_poll.s3 + 0)
.s10:
0d3e : 2c c8 1c BIT $1cc8 ; (keyb_matrix + 1)
0d41 : 10 07 __ BPL $0d4a ; (keyb_poll.s11 + 0)
.s12:
0d43 : ad cd 1c LDA $1ccd ; (keyb_matrix + 6)
0d46 : 29 10 __ AND #$10
0d48 : d0 91 __ BNE $0cdb ; (keyb_poll.s3 + 0)
.s11:
0d4a : ad c6 1c LDA $1cc6 ; (keyb_key + 0)
0d4d : 09 40 __ ORA #$40
0d4f : 8d c6 1c STA $1cc6 ; (keyb_key + 0)
0d52 : b0 87 __ BCS $0cdb ; (keyb_poll.s3 + 0)
--------------------------------------------------------------------
drawBox: ; drawBox(u8,u8)->void
.s4:
0d54 : a5 11 __ LDA P4 ; (x + 0)
0d56 : 85 0d __ STA P0 
0d58 : a5 12 __ LDA P5 ; (y + 0)
0d5a : 85 0e __ STA P1 
0d5c : a9 3b __ LDA #$3b
0d5e : 85 0f __ STA P2 
0d60 : a9 1c __ LDA #$1c
0d62 : 85 10 __ STA P3 
0d64 : 20 39 0c JSR $0c39 ; (putsxy.s4 + 0)
0d67 : a6 12 __ LDX P5 ; (y + 0)
0d69 : e8 __ __ INX
0d6a : 86 0e __ STX P1 
0d6c : a9 4a __ LDA #$4a
0d6e : 85 0f __ STA P2 
0d70 : a9 1c __ LDA #$1c
0d72 : 85 10 __ STA P3 
0d74 : 20 39 0c JSR $0c39 ; (putsxy.s4 + 0)
0d77 : e6 0e __ INC P1 
0d79 : a9 59 __ LDA #$59
0d7b : 85 0f __ STA P2 
0d7d : a9 1c __ LDA #$1c
0d7f : 85 10 __ STA P3 
0d81 : 20 39 0c JSR $0c39 ; (putsxy.s4 + 0)
0d84 : e6 0e __ INC P1 
0d86 : a9 68 __ LDA #$68
0d88 : 85 0f __ STA P2 
0d8a : a9 1c __ LDA #$1c
0d8c : 85 10 __ STA P3 
0d8e : 20 39 0c JSR $0c39 ; (putsxy.s4 + 0)
0d91 : e6 0e __ INC P1 
0d93 : a9 77 __ LDA #$77
0d95 : 85 0f __ STA P2 
0d97 : a9 1c __ LDA #$1c
0d99 : 85 10 __ STA P3 
0d9b : 20 39 0c JSR $0c39 ; (putsxy.s4 + 0)
0d9e : e6 0e __ INC P1 
0da0 : a9 86 __ LDA #$86
0da2 : 85 0f __ STA P2 
0da4 : a9 1c __ LDA #$1c
0da6 : 85 10 __ STA P3 
0da8 : 4c 39 0c JMP $0c39 ; (putsxy.s4 + 0)
--------------------------------------------------------------------
set_sstr: ; set_sstr(struct sstr*,const u8*)->void
.s4:
0dab : a0 00 __ LDY #$00
0dad : b1 0f __ LDA (P2),y ; (src + 0)
0daf : f0 0b __ BEQ $0dbc ; (set_sstr.s7 + 0)
.l5:
0db1 : c0 1f __ CPY #$1f
0db3 : b0 07 __ BCS $0dbc ; (set_sstr.s7 + 0)
.s6:
0db5 : c8 __ __ INY
0db6 : 91 0d __ STA (P0),y ; (s + 0)
0db8 : b1 0f __ LDA (P2),y ; (src + 0)
0dba : d0 f5 __ BNE $0db1 ; (set_sstr.l5 + 0)
.s7:
0dbc : 84 1b __ STY ACCU + 0 
0dbe : a9 00 __ LDA #$00
0dc0 : c8 __ __ INY
0dc1 : 91 0d __ STA (P0),y ; (s + 0)
0dc3 : a5 1b __ LDA ACCU + 0 
0dc5 : a0 00 __ LDY #$00
0dc7 : 91 0d __ STA (P0),y ; (s + 0)
.s3:
0dc9 : 60 __ __ RTS
--------------------------------------------------------------------
0dca : __ __ __ BYT 49 4e 20 00                                     : IN .
--------------------------------------------------------------------
append_sstr_num: ; append_sstr_num(struct sstr*,i16)->void
.s4:
0dce : a5 15 __ LDA P8 ; (num + 0)
0dd0 : 85 0d __ STA P0 
0dd2 : a5 16 __ LDA P9 ; (num + 1)
0dd4 : 85 0e __ STA P1 
0dd6 : a9 0a __ LDA #$0a
0dd8 : 85 11 __ STA P4 
0dda : a9 9f __ LDA #$9f
0ddc : 85 10 __ STA P3 
0dde : a9 00 __ LDA #$00
0de0 : 85 12 __ STA P5 
0de2 : a9 ea __ LDA #$ea
0de4 : 85 0f __ STA P2 
0de6 : 20 f4 0d JSR $0df4 ; (itoa.s4 + 0)
0de9 : a5 13 __ LDA P6 ; (s + 0)
0deb : 85 0d __ STA P0 
0ded : a5 14 __ LDA P7 ; (s + 1)
0def : 85 0e __ STA P1 
0df1 : 4c 9d 0e JMP $0e9d ; (append_sstr.s4 + 0)
--------------------------------------------------------------------
itoa: ; itoa(i16,u8*,u16)->void
.s4:
0df4 : 24 0e __ BIT P1 ; (n + 1)
0df6 : 10 15 __ BPL $0e0d ; (itoa.s6 + 0)
.s5:
0df8 : a9 01 __ LDA #$01
0dfa : 85 43 __ STA T5 + 0 
0dfc : 38 __ __ SEC
0dfd : a9 00 __ LDA #$00
0dff : e5 0d __ SBC P0 ; (n + 0)
0e01 : 85 0d __ STA P0 ; (n + 0)
0e03 : a9 00 __ LDA #$00
0e05 : e5 0e __ SBC P1 ; (n + 1)
0e07 : 85 0e __ STA P1 ; (n + 1)
0e09 : a9 00 __ LDA #$00
0e0b : f0 04 __ BEQ $0e11 ; (itoa.s7 + 0)
.s6:
0e0d : a9 00 __ LDA #$00
0e0f : 85 43 __ STA T5 + 0 
.s7:
0e11 : 85 44 __ STA T6 + 0 
.l8:
0e13 : a5 0d __ LDA P0 ; (n + 0)
0e15 : 85 1b __ STA ACCU + 0 
0e17 : a5 0e __ LDA P1 ; (n + 1)
0e19 : 85 1c __ STA ACCU + 1 
0e1b : a5 11 __ LDA P4 ; (radix + 0)
0e1d : 85 03 __ STA WORK + 0 
0e1f : a5 12 __ LDA P5 ; (radix + 1)
0e21 : 85 04 __ STA WORK + 1 
0e23 : 20 b4 1b JSR $1bb4 ; (divmod + 0)
0e26 : a5 06 __ LDA WORK + 3 
0e28 : f0 08 __ BEQ $0e32 ; (itoa.s18 + 0)
.s19:
0e2a : a5 05 __ LDA WORK + 2 
.s9:
0e2c : 18 __ __ CLC
0e2d : 69 37 __ ADC #$37
0e2f : 4c 3a 0e JMP $0e3a ; (itoa.s10 + 0)
.s18:
0e32 : a5 05 __ LDA WORK + 2 
0e34 : c9 0a __ CMP #$0a
0e36 : b0 f4 __ BCS $0e2c ; (itoa.s9 + 0)
.s17:
0e38 : 09 30 __ ORA #$30
.s10:
0e3a : a4 44 __ LDY T6 + 0 
0e3c : 91 0f __ STA (P2),y ; (s + 0)
0e3e : a5 0d __ LDA P0 ; (n + 0)
0e40 : 85 1b __ STA ACCU + 0 
0e42 : a5 0e __ LDA P1 ; (n + 1)
0e44 : 85 1c __ STA ACCU + 1 
0e46 : a5 11 __ LDA P4 ; (radix + 0)
0e48 : 85 03 __ STA WORK + 0 
0e4a : a5 12 __ LDA P5 ; (radix + 1)
0e4c : 85 04 __ STA WORK + 1 
0e4e : 20 b4 1b JSR $1bb4 ; (divmod + 0)
0e51 : a5 1b __ LDA ACCU + 0 
0e53 : 85 0d __ STA P0 ; (n + 0)
0e55 : a6 44 __ LDX T6 + 0 
0e57 : e6 44 __ INC T6 + 0 
0e59 : a5 1c __ LDA ACCU + 1 
0e5b : 85 0e __ STA P1 ; (n + 1)
0e5d : 05 0d __ ORA P0 ; (n + 0)
0e5f : d0 b2 __ BNE $0e13 ; (itoa.l8 + 0)
.s11:
0e61 : a5 43 __ LDA T5 + 0 
0e63 : f0 0a __ BEQ $0e6f ; (itoa.s12 + 0)
.s16:
0e65 : a9 2d __ LDA #$2d
0e67 : e8 __ __ INX
0e68 : a4 44 __ LDY T6 + 0 
0e6a : e8 __ __ INX
0e6b : 86 44 __ STX T6 + 0 
0e6d : 91 0f __ STA (P2),y ; (s + 0)
.s12:
0e6f : a9 00 __ LDA #$00
0e71 : a4 44 __ LDY T6 + 0 
0e73 : 91 0f __ STA (P2),y ; (s + 0)
0e75 : 85 1b __ STA ACCU + 0 
0e77 : 4c 90 0e JMP $0e90 ; (itoa.l13 + 0)
.s14:
0e7a : a4 1b __ LDY ACCU + 0 
0e7c : b1 0f __ LDA (P2),y ; (s + 0)
0e7e : c6 44 __ DEC T6 + 0 
0e80 : aa __ __ TAX
0e81 : a4 44 __ LDY T6 + 0 
0e83 : b1 0f __ LDA (P2),y ; (s + 0)
0e85 : a4 1b __ LDY ACCU + 0 
0e87 : 91 0f __ STA (P2),y ; (s + 0)
0e89 : 8a __ __ TXA
0e8a : a4 44 __ LDY T6 + 0 
0e8c : 91 0f __ STA (P2),y ; (s + 0)
0e8e : e6 1b __ INC ACCU + 0 
.l13:
0e90 : 18 __ __ CLC
0e91 : a5 1b __ LDA ACCU + 0 
0e93 : 69 01 __ ADC #$01
0e95 : aa __ __ TAX
0e96 : b0 04 __ BCS $0e9c ; (itoa.s3 + 0)
.s15:
0e98 : e4 44 __ CPX T6 + 0 
0e9a : 90 de __ BCC $0e7a ; (itoa.s14 + 0)
.s3:
0e9c : 60 __ __ RTS
--------------------------------------------------------------------
append_sstr: ; append_sstr(struct sstr*,const u8*)->void
.s4:
0e9d : a0 00 __ LDY #$00
0e9f : 84 1b __ STY ACCU + 0 
0ea1 : b1 0d __ LDA (P0),y ; (s + 0)
0ea3 : 85 1c __ STA ACCU + 1 
0ea5 : b1 0f __ LDA (P2),y ; (src + 0)
0ea7 : f0 13 __ BEQ $0ebc ; (append_sstr.s8 + 0)
.l6:
0ea9 : a4 1c __ LDY ACCU + 1 
0eab : c0 1f __ CPY #$1f
0ead : b0 0f __ BCS $0ebe ; (append_sstr.s5 + 0)
.s7:
0eaf : c8 __ __ INY
0eb0 : 84 1c __ STY ACCU + 1 
0eb2 : 91 0d __ STA (P0),y ; (s + 0)
0eb4 : e6 1b __ INC ACCU + 0 
0eb6 : a4 1b __ LDY ACCU + 0 
0eb8 : b1 0f __ LDA (P2),y ; (src + 0)
0eba : d0 ed __ BNE $0ea9 ; (append_sstr.l6 + 0)
.s8:
0ebc : a4 1c __ LDY ACCU + 1 
.s5:
0ebe : a9 00 __ LDA #$00
0ec0 : c8 __ __ INY
0ec1 : 91 0d __ STA (P0),y ; (s + 0)
0ec3 : a5 1c __ LDA ACCU + 1 
0ec5 : a0 00 __ LDY #$00
0ec7 : 91 0d __ STA (P0),y ; (s + 0)
.s3:
0ec9 : 60 __ __ RTS
--------------------------------------------------------------------
0eca : __ __ __ BYT 4f 55 54 20 00                                  : OUT .
--------------------------------------------------------------------
0ecf : __ __ __ BYT 53 57 41 50 20 3f 28 d9 2f ce 29 00             : SWAP ?(./.).
--------------------------------------------------------------------
getch: ; getch()->u8
.l4:
0edb : 20 e4 ff JSR $ffe4 
0ede : 85 1b __ STA ACCU + 0 
0ee0 : a5 1b __ LDA ACCU + 0 
0ee2 : f0 f7 __ BEQ $0edb ; (getch.l4 + 0)
.s5:
0ee4 : 4c e7 0e JMP $0ee7 ; (convch.s4 + 0)
--------------------------------------------------------------------
convch: ; convch(u8)->u8
.s4:
0ee7 : a8 __ __ TAY
0ee8 : ad 3a 1c LDA $1c3a ; (giocharmap + 0)
0eeb : f0 27 __ BEQ $0f14 ; (convch.s5 + 0)
.s6:
0eed : c0 0d __ CPY #$0d
0eef : d0 03 __ BNE $0ef4 ; (convch.s7 + 0)
.s16:
0ef1 : a9 0a __ LDA #$0a
.s3:
0ef3 : 60 __ __ RTS
.s7:
0ef4 : c9 02 __ CMP #$02
0ef6 : 90 1c __ BCC $0f14 ; (convch.s5 + 0)
.s8:
0ef8 : 98 __ __ TYA
0ef9 : c0 41 __ CPY #$41
0efb : 90 17 __ BCC $0f14 ; (convch.s5 + 0)
.s9:
0efd : c9 db __ CMP #$db
0eff : b0 13 __ BCS $0f14 ; (convch.s5 + 0)
.s10:
0f01 : c9 c1 __ CMP #$c1
0f03 : 90 03 __ BCC $0f08 ; (convch.s11 + 0)
.s15:
0f05 : 49 a0 __ EOR #$a0
0f07 : a8 __ __ TAY
.s11:
0f08 : c9 7b __ CMP #$7b
0f0a : b0 08 __ BCS $0f14 ; (convch.s5 + 0)
.s12:
0f0c : c9 61 __ CMP #$61
0f0e : b0 06 __ BCS $0f16 ; (convch.s14 + 0)
.s13:
0f10 : c9 5b __ CMP #$5b
0f12 : 90 02 __ BCC $0f16 ; (convch.s14 + 0)
.s5:
0f14 : 98 __ __ TYA
0f15 : 60 __ __ RTS
.s14:
0f16 : 49 20 __ EOR #$20
0f18 : 60 __ __ RTS
--------------------------------------------------------------------
resetCPU: ; resetCPU()->void
.s4:
0f19 : 4c e2 fc JMP $fce2 
.s3:
0f1c : 60 __ __ RTS
--------------------------------------------------------------------
getDriveInfo: ; getDriveInfo(u8)->i16
.s4:
0f1d : a9 af __ LDA #$af
0f1f : 85 0d __ STA P0 
0f21 : a9 0f __ LDA #$0f
0f23 : 85 0e __ STA P1 
0f25 : 20 99 0f JSR $0f99 ; (krnio_setnam.s4 + 0)
0f28 : a9 0f __ LDA #$0f
0f2a : 85 0d __ STA P0 
0f2c : 85 0f __ STA P2 
0f2e : a5 13 __ LDA P6 ; (driveid + 0)
0f30 : 85 0e __ STA P1 
0f32 : 20 b0 0f JSR $0fb0 ; (krnio_open.s4 + 0)
0f35 : aa __ __ TAX
0f36 : d0 07 __ BNE $0f3f ; (getDriveInfo.s6 + 0)
.s5:
0f38 : a9 ff __ LDA #$ff
0f3a : 85 1b __ STA ACCU + 0 
.s3:
0f3c : 85 1c __ STA ACCU + 1 
0f3e : 60 __ __ RTS
.s6:
0f3f : a9 0f __ LDA #$0f
0f41 : 85 0e __ STA P1 
0f43 : a9 10 __ LDA #$10
0f45 : 85 10 __ STA P3 
0f47 : a9 48 __ LDA #$48
0f49 : 85 0f __ STA P2 
0f4b : 20 de 0f JSR $0fde ; (krnio_puts.s4 + 0)
0f4e : a5 1b __ LDA ACCU + 0 
0f50 : 85 47 __ STA T0 + 0 
0f52 : a5 1c __ LDA ACCU + 1 
0f54 : 85 48 __ STA T0 + 1 
0f56 : 30 33 __ BMI $0f8b ; (getDriveInfo.s8 + 0)
.s9:
0f58 : 05 1b __ ORA ACCU + 0 
0f5a : f0 2f __ BEQ $0f8b ; (getDriveInfo.s8 + 0)
.s7:
0f5c : a9 0f __ LDA #$0f
0f5e : 85 0e __ STA P1 
0f60 : a9 9f __ LDA #$9f
0f62 : 85 10 __ STA P3 
0f64 : a9 20 __ LDA #$20
0f66 : 85 11 __ STA P4 
0f68 : a9 00 __ LDA #$00
0f6a : 85 12 __ STA P5 
0f6c : a9 c6 __ LDA #$c6
0f6e : 85 0f __ STA P2 
0f70 : 20 53 10 JSR $1053 ; (krnio_read.s4 + 0)
0f73 : a9 00 __ LDA #$00
0f75 : 8d e5 9f STA $9fe5 ; (tmpbuf + 31)
0f78 : a9 d6 __ LDA #$d6
0f7a : 85 0d __ STA P0 
0f7c : a9 9f __ LDA #$9f
0f7e : 85 0e __ STA P1 
0f80 : 20 f2 10 JSR $10f2 ; (atoi.l4 + 0)
0f83 : a5 1b __ LDA ACCU + 0 
0f85 : 85 47 __ STA T0 + 0 
0f87 : a5 1c __ LDA ACCU + 1 
0f89 : 85 48 __ STA T0 + 1 
.s8:
0f8b : a9 0f __ LDA #$0f
0f8d : 20 4b 10 JSR $104b ; (krnio_close.s4 + 0)
0f90 : a5 47 __ LDA T0 + 0 
0f92 : 85 1b __ STA ACCU + 0 
0f94 : a5 48 __ LDA T0 + 1 
0f96 : 4c 3c 0f JMP $0f3c ; (getDriveInfo.s3 + 0)
--------------------------------------------------------------------
krnio_setnam: ; krnio_setnam(const u8*)->void
.s4:
0f99 : a5 0d __ LDA P0 
0f9b : 05 0e __ ORA P1 
0f9d : f0 08 __ BEQ $0fa7 ; (krnio_setnam.s4 + 14)
0f9f : a0 ff __ LDY #$ff
0fa1 : c8 __ __ INY
0fa2 : b1 0d __ LDA (P0),y 
0fa4 : d0 fb __ BNE $0fa1 ; (krnio_setnam.s4 + 8)
0fa6 : 98 __ __ TYA
0fa7 : a6 0d __ LDX P0 
0fa9 : a4 0e __ LDY P1 
0fab : 20 bd ff JSR $ffbd 
.s3:
0fae : 60 __ __ RTS
--------------------------------------------------------------------
0faf : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
krnio_open: ; krnio_open(u8,u8,u8)->bool
.s4:
0fb0 : a9 00 __ LDA #$00
0fb2 : a6 0d __ LDX P0 ; (fnum + 0)
0fb4 : 9d d0 1c STA $1cd0,x ; (krnio_pstatus + 0)
0fb7 : a9 00 __ LDA #$00
0fb9 : 85 1b __ STA ACCU + 0 
0fbb : 85 1c __ STA ACCU + 1 
0fbd : a5 0d __ LDA P0 ; (fnum + 0)
0fbf : a6 0e __ LDX P1 
0fc1 : a4 0f __ LDY P2 
0fc3 : 20 ba ff JSR $ffba 
0fc6 : 20 c0 ff JSR $ffc0 
0fc9 : 90 08 __ BCC $0fd3 ; (krnio_open.s4 + 35)
0fcb : a5 0d __ LDA P0 ; (fnum + 0)
0fcd : 20 c3 ff JSR $ffc3 
0fd0 : 4c d7 0f JMP $0fd7 ; (krnio_open.s4 + 39)
0fd3 : a9 01 __ LDA #$01
0fd5 : 85 1b __ STA ACCU + 0 
0fd7 : a5 1b __ LDA ACCU + 0 
0fd9 : f0 02 __ BEQ $0fdd ; (krnio_open.s3 + 0)
.s5:
0fdb : a9 01 __ LDA #$01
.s3:
0fdd : 60 __ __ RTS
--------------------------------------------------------------------
krnio_puts: ; krnio_puts(u8,const u8*)->i16
.s4:
0fde : a5 0e __ LDA P1 ; (fnum + 0)
0fe0 : 20 1f 10 JSR $101f ; (krnio_chkout.s4 + 0)
0fe3 : aa __ __ TAX
0fe4 : d0 07 __ BNE $0fed ; (krnio_puts.s6 + 0)
.s5:
0fe6 : a9 ff __ LDA #$ff
0fe8 : 85 1b __ STA ACCU + 0 
.s3:
0fea : 85 1c __ STA ACCU + 1 
0fec : 60 __ __ RTS
.s6:
0fed : a9 00 __ LDA #$00
0fef : 85 43 __ STA T0 + 0 
0ff1 : 85 44 __ STA T0 + 1 
0ff3 : a5 0f __ LDA P2 ; (data + 0)
0ff5 : 85 45 __ STA T1 + 0 
0ff7 : a5 10 __ LDA P3 ; (data + 1)
0ff9 : 85 46 __ STA T1 + 1 
.l11:
0ffb : a0 00 __ LDY #$00
0ffd : b1 45 __ LDA (T1 + 0),y 
0fff : d0 0c __ BNE $100d ; (krnio_puts.s8 + 0)
.s7:
1001 : 20 44 10 JSR $1044 ; (krnio_clrchn.s4 + 0)
1004 : a5 43 __ LDA T0 + 0 
1006 : 85 1b __ STA ACCU + 0 
1008 : a5 44 __ LDA T0 + 1 
100a : 4c ea 0f JMP $0fea ; (krnio_puts.s3 + 0)
.s8:
100d : 20 34 10 JSR $1034 ; (krnio_chrout.s4 + 0)
1010 : e6 43 __ INC T0 + 0 
1012 : d0 02 __ BNE $1016 ; (krnio_puts.s10 + 0)
.s9:
1014 : e6 44 __ INC T0 + 1 
.s10:
1016 : e6 45 __ INC T1 + 0 
1018 : d0 e1 __ BNE $0ffb ; (krnio_puts.l11 + 0)
.s12:
101a : e6 46 __ INC T1 + 1 
101c : 4c fb 0f JMP $0ffb ; (krnio_puts.l11 + 0)
--------------------------------------------------------------------
krnio_chkout: ; krnio_chkout(u8)->bool
.s4:
101f : 85 0d __ STA P0 
1021 : a6 0d __ LDX P0 
1023 : 20 c9 ff JSR $ffc9 
1026 : a9 00 __ LDA #$00
1028 : 2a __ __ ROL
1029 : 49 01 __ EOR #$01
102b : 85 1b __ STA ACCU + 0 
102d : a5 1b __ LDA ACCU + 0 
102f : f0 02 __ BEQ $1033 ; (krnio_chkout.s3 + 0)
.s5:
1031 : a9 01 __ LDA #$01
.s3:
1033 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrout: ; krnio_chrout(u8)->bool
.s4:
1034 : 85 0d __ STA P0 
1036 : a5 0d __ LDA P0 
1038 : 20 d2 ff JSR $ffd2 
103b : 85 1b __ STA ACCU + 0 
103d : a5 1b __ LDA ACCU + 0 
103f : f0 02 __ BEQ $1043 ; (krnio_chrout.s3 + 0)
.s5:
1041 : a9 01 __ LDA #$01
.s3:
1043 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_clrchn: ; krnio_clrchn()->void
.s4:
1044 : 20 cc ff JSR $ffcc 
.s3:
1047 : 60 __ __ RTS
--------------------------------------------------------------------
1048 : __ __ __ BYT 55 49 00                                        : UI.
--------------------------------------------------------------------
krnio_close: ; krnio_close(u8)->void
.s4:
104b : 85 0d __ STA P0 
104d : a5 0d __ LDA P0 
104f : 20 c3 ff JSR $ffc3 
.s3:
1052 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_read: ; krnio_read(u8,u8*,i16)->i16
.s4:
1053 : a6 0e __ LDX P1 ; (fnum + 0)
1055 : bd d0 1c LDA $1cd0,x ; (krnio_pstatus + 0)
1058 : c9 40 __ CMP #$40
105a : d0 07 __ BNE $1063 ; (krnio_read.s5 + 0)
.s15:
105c : a9 00 __ LDA #$00
.s16:
105e : 85 1b __ STA ACCU + 0 
.s3:
1060 : 85 1c __ STA ACCU + 1 
1062 : 60 __ __ RTS
.s5:
1063 : 86 44 __ STX T2 + 0 
1065 : 8a __ __ TXA
1066 : 20 c9 10 JSR $10c9 ; (krnio_chkin.s4 + 0)
1069 : aa __ __ TAX
106a : d0 04 __ BNE $1070 ; (krnio_read.s7 + 0)
.s6:
106c : a9 ff __ LDA #$ff
106e : d0 ee __ BNE $105e ; (krnio_read.s16 + 0)
.s7:
1070 : a9 00 __ LDA #$00
1072 : 85 45 __ STA T3 + 0 
1074 : 85 46 __ STA T3 + 1 
1076 : a5 12 __ LDA P5 ; (num + 1)
1078 : 30 43 __ BMI $10bd ; (krnio_read.s8 + 0)
.s14:
107a : 05 11 __ ORA P4 ; (num + 0)
107c : f0 3f __ BEQ $10bd ; (krnio_read.s8 + 0)
.l9:
107e : 20 de 10 JSR $10de ; (krnio_chrin.s4 + 0)
1081 : 85 43 __ STA T0 + 0 
1083 : 20 e6 10 JSR $10e6 ; (krnio_status.s4 + 0)
1086 : 85 1d __ STA ACCU + 2 
1088 : a6 44 __ LDX T2 + 0 
108a : 9d d0 1c STA $1cd0,x ; (krnio_pstatus + 0)
108d : aa __ __ TAX
108e : f0 04 __ BEQ $1094 ; (krnio_read.s10 + 0)
.s13:
1090 : c9 40 __ CMP #$40
1092 : d0 29 __ BNE $10bd ; (krnio_read.s8 + 0)
.s10:
1094 : a5 45 __ LDA T3 + 0 
1096 : 85 1b __ STA ACCU + 0 
1098 : 18 __ __ CLC
1099 : a5 10 __ LDA P3 ; (data + 1)
109b : 65 46 __ ADC T3 + 1 
109d : 85 1c __ STA ACCU + 1 
109f : a5 43 __ LDA T0 + 0 
10a1 : a4 0f __ LDY P2 ; (data + 0)
10a3 : 91 1b __ STA (ACCU + 0),y 
10a5 : e6 45 __ INC T3 + 0 
10a7 : d0 02 __ BNE $10ab ; (krnio_read.s18 + 0)
.s17:
10a9 : e6 46 __ INC T3 + 1 
.s18:
10ab : a5 1d __ LDA ACCU + 2 
10ad : d0 0e __ BNE $10bd ; (krnio_read.s8 + 0)
.s11:
10af : a5 46 __ LDA T3 + 1 
10b1 : c5 12 __ CMP P5 ; (num + 1)
10b3 : 90 c9 __ BCC $107e ; (krnio_read.l9 + 0)
.s19:
10b5 : d0 06 __ BNE $10bd ; (krnio_read.s8 + 0)
.s12:
10b7 : a5 45 __ LDA T3 + 0 
10b9 : c5 11 __ CMP P4 ; (num + 0)
10bb : 90 c1 __ BCC $107e ; (krnio_read.l9 + 0)
.s8:
10bd : 20 44 10 JSR $1044 ; (krnio_clrchn.s4 + 0)
10c0 : a5 45 __ LDA T3 + 0 
10c2 : 85 1b __ STA ACCU + 0 
10c4 : a5 46 __ LDA T3 + 1 
10c6 : 4c 60 10 JMP $1060 ; (krnio_read.s3 + 0)
--------------------------------------------------------------------
krnio_chkin: ; krnio_chkin(u8)->bool
.s4:
10c9 : 85 0d __ STA P0 
10cb : a6 0d __ LDX P0 
10cd : 20 c6 ff JSR $ffc6 
10d0 : a9 00 __ LDA #$00
10d2 : 2a __ __ ROL
10d3 : 49 01 __ EOR #$01
10d5 : 85 1b __ STA ACCU + 0 
10d7 : a5 1b __ LDA ACCU + 0 
10d9 : f0 02 __ BEQ $10dd ; (krnio_chkin.s3 + 0)
.s5:
10db : a9 01 __ LDA #$01
.s3:
10dd : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrin: ; krnio_chrin()->u8
.s4:
10de : 20 cf ff JSR $ffcf 
10e1 : 85 1b __ STA ACCU + 0 
.s3:
10e3 : a5 1b __ LDA ACCU + 0 
10e5 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_status: ; krnio_status()->enum krnioerr
.s4:
10e6 : 20 b7 ff JSR $ffb7 
10e9 : 85 1b __ STA ACCU + 0 
10eb : a9 00 __ LDA #$00
10ed : 85 1c __ STA ACCU + 1 
.s3:
10ef : a5 1b __ LDA ACCU + 0 
10f1 : 60 __ __ RTS
--------------------------------------------------------------------
atoi: ; atoi(const u8*)->i16
.l4:
10f2 : a0 00 __ LDY #$00
10f4 : b1 0d __ LDA (P0),y ; (s + 0)
10f6 : aa __ __ TAX
10f7 : a5 0d __ LDA P0 ; (s + 0)
10f9 : 85 43 __ STA T0 + 0 
10fb : 18 __ __ CLC
10fc : 69 01 __ ADC #$01
10fe : 85 0d __ STA P0 ; (s + 0)
1100 : a5 0e __ LDA P1 ; (s + 1)
1102 : 85 44 __ STA T0 + 1 
1104 : 69 00 __ ADC #$00
1106 : 85 0e __ STA P1 ; (s + 1)
1108 : 8a __ __ TXA
1109 : e0 21 __ CPX #$21
110b : b0 08 __ BCS $1115 ; (atoi.s5 + 0)
.s16:
110d : aa __ __ TAX
110e : d0 e2 __ BNE $10f2 ; (atoi.l4 + 0)
.s17:
1110 : 85 1b __ STA ACCU + 0 
.s3:
1112 : 85 1c __ STA ACCU + 1 
1114 : 60 __ __ RTS
.s5:
1115 : e0 2d __ CPX #$2d
1117 : d0 1d __ BNE $1136 ; (atoi.s6 + 0)
.s15:
1119 : a9 01 __ LDA #$01
111b : 85 1d __ STA ACCU + 2 
.s14:
111d : 18 __ __ CLC
111e : a5 43 __ LDA T0 + 0 
1120 : 69 02 __ ADC #$02
1122 : 85 0d __ STA P0 ; (s + 0)
1124 : a5 44 __ LDA T0 + 1 
1126 : 69 00 __ ADC #$00
1128 : 85 0e __ STA P1 ; (s + 1)
112a : a0 01 __ LDY #$01
112c : b1 43 __ LDA (T0 + 0),y 
.s7:
112e : 85 1c __ STA ACCU + 1 
1130 : a9 00 __ LDA #$00
1132 : 85 43 __ STA T0 + 0 
1134 : f0 08 __ BEQ $113e ; (atoi.l8 + 0)
.s6:
1136 : 84 1d __ STY ACCU + 2 
1138 : e0 2b __ CPX #$2b
113a : d0 f2 __ BNE $112e ; (atoi.s7 + 0)
113c : f0 df __ BEQ $111d ; (atoi.s14 + 0)
.l8:
113e : 85 44 __ STA T0 + 1 
1140 : a5 1c __ LDA ACCU + 1 
1142 : c9 30 __ CMP #$30
1144 : 90 3b __ BCC $1181 ; (atoi.s9 + 0)
.s12:
1146 : c9 3a __ CMP #$3a
1148 : b0 37 __ BCS $1181 ; (atoi.s9 + 0)
.s13:
114a : a0 00 __ LDY #$00
114c : b1 0d __ LDA (P0),y ; (s + 0)
114e : a8 __ __ TAY
114f : e6 0d __ INC P0 ; (s + 0)
1151 : d0 02 __ BNE $1155 ; (atoi.s19 + 0)
.s18:
1153 : e6 0e __ INC P1 ; (s + 1)
.s19:
1155 : a5 43 __ LDA T0 + 0 
1157 : 0a __ __ ASL
1158 : 85 1b __ STA ACCU + 0 
115a : a5 44 __ LDA T0 + 1 
115c : 2a __ __ ROL
115d : 06 1b __ ASL ACCU + 0 
115f : 2a __ __ ROL
1160 : aa __ __ TAX
1161 : 18 __ __ CLC
1162 : a5 1b __ LDA ACCU + 0 
1164 : 65 43 __ ADC T0 + 0 
1166 : 85 43 __ STA T0 + 0 
1168 : 8a __ __ TXA
1169 : 65 44 __ ADC T0 + 1 
116b : 06 43 __ ASL T0 + 0 
116d : 2a __ __ ROL
116e : aa __ __ TAX
116f : a5 1c __ LDA ACCU + 1 
1171 : 84 1c __ STY ACCU + 1 
1173 : 38 __ __ SEC
1174 : e9 30 __ SBC #$30
1176 : 18 __ __ CLC
1177 : 65 43 __ ADC T0 + 0 
1179 : 85 43 __ STA T0 + 0 
117b : 8a __ __ TXA
117c : 69 00 __ ADC #$00
117e : 4c 3e 11 JMP $113e ; (atoi.l8 + 0)
.s9:
1181 : a5 1d __ LDA ACCU + 2 
1183 : d0 09 __ BNE $118e ; (atoi.s11 + 0)
.s10:
1185 : a5 43 __ LDA T0 + 0 
1187 : 85 1b __ STA ACCU + 0 
1189 : a5 44 __ LDA T0 + 1 
118b : 4c 12 11 JMP $1112 ; (atoi.s3 + 0)
.s11:
118e : 38 __ __ SEC
118f : a9 00 __ LDA #$00
1191 : e5 43 __ SBC T0 + 0 
1193 : 85 1b __ STA ACCU + 0 
1195 : a9 00 __ LDA #$00
1197 : e5 44 __ SBC T0 + 1 
1199 : 4c 12 11 JMP $1112 ; (atoi.s3 + 0)
--------------------------------------------------------------------
119c : __ __ __ BYT 3f 00                                           : ?.
--------------------------------------------------------------------
119e : __ __ __ BYT 50 52 45 53 53 20 c3 20 46 4f 52 20 43 4f 4d 50 : PRESS . FOR COMP
11ae : __ __ __ BYT 4c 45 54 45 20 43 4f 50 59 00                   : LETE COPY.
--------------------------------------------------------------------
11b8 : __ __ __ BYT 50 52 45 53 53 20 cf 20 46 4f 52 20 4f 50 54 49 : PRESS . FOR OPTI
11c8 : __ __ __ BYT 4d 49 5a 45 44 20 43 4f 50 59 00                : MIZED COPY.
--------------------------------------------------------------------
11d3 : __ __ __ BYT 4f 52 20 d1 20 54 4f 20 51 55 49 54 00          : OR . TO QUIT.
--------------------------------------------------------------------
printTrackNumbers: ; printTrackNumbers()->void
.s4:
11e0 : a9 01 __ LDA #$01
11e2 : 85 45 __ STA T1 + 0 
11e4 : a9 03 __ LDA #$03
11e6 : 85 46 __ STA T2 + 0 
.l5:
11e8 : a9 c8 __ LDA #$c8
11ea : 85 0d __ STA P0 
11ec : a9 0f __ LDA #$0f
11ee : 85 10 __ STA P3 
11f0 : a9 9f __ LDA #$9f
11f2 : 85 0e __ STA P1 
11f4 : a9 af __ LDA #$af
11f6 : 85 0f __ STA P2 
11f8 : 20 ab 0d JSR $0dab ; (set_sstr.s4 + 0)
11fb : a5 45 __ LDA T1 + 0 
11fd : 85 1b __ STA ACCU + 0 
11ff : a9 c8 __ LDA #$c8
1201 : 85 13 __ STA P6 
1203 : a9 9f __ LDA #$9f
1205 : 85 14 __ STA P7 
1207 : a9 00 __ LDA #$00
1209 : 85 1c __ STA ACCU + 1 
120b : 85 04 __ STA WORK + 1 
120d : a9 0a __ LDA #$0a
120f : 85 03 __ STA WORK + 0 
1211 : 20 b4 1b JSR $1bb4 ; (divmod + 0)
1214 : a5 05 __ LDA WORK + 2 
1216 : 85 47 __ STA T8 + 0 
1218 : a5 06 __ LDA WORK + 3 
121a : 85 48 __ STA T8 + 1 
121c : a5 1b __ LDA ACCU + 0 
121e : 85 15 __ STA P8 
1220 : a5 1c __ LDA ACCU + 1 
1222 : 85 16 __ STA P9 
1224 : 20 ce 0d JSR $0dce ; (append_sstr_num.s4 + 0)
1227 : a5 46 __ LDA T2 + 0 
1229 : 85 0d __ STA P0 
122b : a9 01 __ LDA #$01
122d : 85 0e __ STA P1 
122f : a9 9f __ LDA #$9f
1231 : 85 10 __ STA P3 
1233 : a9 c9 __ LDA #$c9
1235 : 85 0f __ STA P2 
1237 : 20 39 0c JSR $0c39 ; (putsxy.s4 + 0)
123a : a9 c8 __ LDA #$c8
123c : 85 0d __ STA P0 
123e : a9 0f __ LDA #$0f
1240 : 85 10 __ STA P3 
1242 : a9 9f __ LDA #$9f
1244 : 85 0e __ STA P1 
1246 : a9 af __ LDA #$af
1248 : 85 0f __ STA P2 
124a : 20 ab 0d JSR $0dab ; (set_sstr.s4 + 0)
124d : a5 47 __ LDA T8 + 0 
124f : 85 15 __ STA P8 
1251 : a5 48 __ LDA T8 + 1 
1253 : 85 16 __ STA P9 
1255 : 20 ce 0d JSR $0dce ; (append_sstr_num.s4 + 0)
1258 : a5 46 __ LDA T2 + 0 
125a : 85 0d __ STA P0 
125c : e6 46 __ INC T2 + 0 
125e : a9 02 __ LDA #$02
1260 : 85 0e __ STA P1 
1262 : a9 9f __ LDA #$9f
1264 : 85 10 __ STA P3 
1266 : a9 c9 __ LDA #$c9
1268 : 85 0f __ STA P2 
126a : 20 39 0c JSR $0c39 ; (putsxy.s4 + 0)
126d : e6 45 __ INC T1 + 0 
126f : a5 45 __ LDA T1 + 0 
1271 : c9 24 __ CMP #$24
1273 : b0 03 __ BCS $1278 ; (printTrackNumbers.s3 + 0)
1275 : 4c e8 11 JMP $11e8 ; (printTrackNumbers.l5 + 0)
.s3:
1278 : 60 __ __ RTS
--------------------------------------------------------------------
printSectorNumbers: ; printSectorNumbers()->void
.s4:
1279 : a9 00 __ LDA #$00
127b : 85 16 __ STA P9 
127d : 85 15 __ STA P8 
127f : a9 04 __ LDA #$04
1281 : 85 45 __ STA T1 + 0 
.l5:
1283 : a9 c8 __ LDA #$c8
1285 : 85 0d __ STA P0 
1287 : a9 0f __ LDA #$0f
1289 : 85 10 __ STA P3 
128b : a9 9f __ LDA #$9f
128d : 85 0e __ STA P1 
128f : a9 af __ LDA #$af
1291 : 85 0f __ STA P2 
1293 : 20 ab 0d JSR $0dab ; (set_sstr.s4 + 0)
1296 : a9 c8 __ LDA #$c8
1298 : 85 13 __ STA P6 
129a : a9 9f __ LDA #$9f
129c : 85 14 __ STA P7 
129e : 20 ce 0d JSR $0dce ; (append_sstr_num.s4 + 0)
12a1 : a5 45 __ LDA T1 + 0 
12a3 : 85 0e __ STA P1 
12a5 : a9 00 __ LDA #$00
12a7 : 85 0d __ STA P0 
12a9 : e6 45 __ INC T1 + 0 
12ab : a9 c9 __ LDA #$c9
12ad : 85 0f __ STA P2 
12af : a9 9f __ LDA #$9f
12b1 : 85 10 __ STA P3 
12b3 : 20 39 0c JSR $0c39 ; (putsxy.s4 + 0)
12b6 : e6 15 __ INC P8 
12b8 : a5 15 __ LDA P8 
12ba : c9 15 __ CMP #$15
12bc : 90 c5 __ BCC $1283 ; (printSectorNumbers.l5 + 0)
.s3:
12be : 60 __ __ RTS
--------------------------------------------------------------------
printLegend: ; printLegend()->void
.s4:
12bf : a9 21 __ LDA #$21
12c1 : 85 0d __ STA P0 
12c3 : a9 12 __ LDA #$12
12c5 : 85 10 __ STA P3 
12c7 : a9 16 __ LDA #$16
12c9 : 85 0e __ STA P1 
12cb : a9 f4 __ LDA #$f4
12cd : 85 0f __ STA P2 
12cf : 20 39 0c JSR $0c39 ; (putsxy.s4 + 0)
12d2 : e6 0e __ INC P1 
12d4 : a9 1c __ LDA #$1c
12d6 : 85 0d __ STA P0 
12d8 : a9 00 __ LDA #$00
12da : 85 0f __ STA P2 
12dc : a9 13 __ LDA #$13
12de : 85 10 __ STA P3 
12e0 : 20 39 0c JSR $0c39 ; (putsxy.s4 + 0)
12e3 : e6 0e __ INC P1 
12e5 : a9 1a __ LDA #$1a
12e7 : 85 0d __ STA P0 
12e9 : a9 0d __ LDA #$0d
12eb : 85 0f __ STA P2 
12ed : a9 13 __ LDA #$13
12ef : 85 10 __ STA P3 
12f1 : 4c 39 0c JMP $0c39 ; (putsxy.s4 + 0)
--------------------------------------------------------------------
12f4 : __ __ __ BYT 21 3d 45 52 52 4f 52 00                         : !=ERROR.
--------------------------------------------------------------------
12fc : __ __ __ BYT 52 00                                           : R.
--------------------------------------------------------------------
12fe : __ __ __ BYT 23 00                                           : #.
--------------------------------------------------------------------
1300 : __ __ __ BYT 4f 3d 53 4b 49 50 2c 20 2e 3d 4f 4b 00          : O=SKIP, .=OK.
--------------------------------------------------------------------
130d : __ __ __ BYT 52 3d 52 45 41 44 2c 57 3d 57 52 49 54 45 00    : R=READ,W=WRITE.
--------------------------------------------------------------------
131c : __ __ __ BYT 50 52 45 53 53 20 41 4e 44 20 48 4f 4c 44 20 d3 : PRESS AND HOLD .
132c : __ __ __ BYT 20 54 4f 20 53 54 4f 50 00                      :  TO STOP.
--------------------------------------------------------------------
copyDisk: ; copyDisk(u8,u8,bool)->i16
.s4:
1335 : 20 f8 0b JSR $0bf8 ; (setColorInfo.s4 + 0)
1338 : 20 58 14 JSR $1458 ; (resetCiaTimer.s4 + 0)
133b : ad fd 9f LDA $9ffd ; (sstack + 7)
133e : 85 4d __ STA T4 + 0 
1340 : 85 10 __ STA P3 
1342 : ad fe 9f LDA $9ffe ; (sstack + 8)
1345 : 85 4e __ STA T5 + 0 
1347 : 85 11 __ STA P4 
1349 : 20 8e 14 JSR $148e ; (openCommandCannels.s4 + 0)
134c : 24 1c __ BIT ACCU + 1 
134e : 30 0a __ BMI $135a ; (copyDisk.s20 + 0)
.s5:
1350 : 20 d2 14 JSR $14d2 ; (changeBusSpeed.s4 + 0)
1353 : 24 1c __ BIT ACCU + 1 
1355 : 10 0a __ BPL $1361 ; (copyDisk.s6 + 0)
.s19:
1357 : 20 b0 17 JSR $17b0 ; (closeCommandChannels.s4 + 0)
.s20:
135a : a9 ff __ LDA #$ff
.s3:
135c : 85 1b __ STA ACCU + 0 
135e : 85 1c __ STA ACCU + 1 
1360 : 60 __ __ RTS
.s6:
1361 : a9 01 __ LDA #$01
1363 : 85 4f __ STA T6 + 0 
.l7:
1365 : a9 00 __ LDA #$00
1367 : 85 50 __ STA T7 + 0 
1369 : f0 04 __ BEQ $136f ; (copyDisk.l8 + 0)
.s15:
136b : e6 50 __ INC T7 + 0 
136d : a5 50 __ LDA T7 + 0 
.l8:
136f : a6 4f __ LDX T6 + 0 
1371 : dd a2 1c CMP $1ca2,x 
1374 : 90 19 __ BCC $138f ; (copyDisk.s11 + 0)
.s9:
1376 : e6 4f __ INC T6 + 0 
1378 : a5 4f __ LDA T6 + 0 
137a : c9 24 __ CMP #$24
137c : 90 e7 __ BCC $1365 ; (copyDisk.l7 + 0)
.s10:
137e : 20 b0 17 JSR $17b0 ; (closeCommandChannels.s4 + 0)
1381 : a9 03 __ LDA #$03
1383 : 85 13 __ STA P6 
1385 : 20 3f 18 JSR $183f ; (stopCiaTimer.s4 + 0)
1388 : 20 ba 17 JSR $17ba ; (printTimer.s4 + 0)
138b : a9 00 __ LDA #$00
138d : f0 cd __ BEQ $135c ; (copyDisk.s3 + 0)
.s11:
138f : a9 00 __ LDA #$00
1391 : 85 13 __ STA P6 
1393 : 20 ba 17 JSR $17ba ; (printTimer.s4 + 0)
1396 : 20 35 18 JSR $1835 ; (getchx.s4 + 0)
1399 : c9 53 __ CMP #$53
139b : f0 6a __ BEQ $1407 ; (copyDisk.s16 + 0)
.s12:
139d : a6 4f __ LDX T6 + 0 
139f : e8 __ __ INX
13a0 : e8 __ __ INX
13a1 : 86 4b __ STX T1 + 0 
13a3 : 86 0d __ STX P0 
13a5 : 18 __ __ CLC
13a6 : a5 50 __ LDA T7 + 0 
13a8 : 69 04 __ ADC #$04
13aa : 85 4c __ STA T2 + 0 
13ac : 85 0e __ STA P1 
13ae : 20 50 18 JSR $1850 ; (setAccentXY.s4 + 0)
13b1 : a9 fc __ LDA #$fc
13b3 : 85 0f __ STA P2 
13b5 : a9 12 __ LDA #$12
13b7 : 85 10 __ STA P3 
13b9 : 20 39 0c JSR $0c39 ; (putsxy.s4 + 0)
13bc : a5 4d __ LDA T4 + 0 
13be : 8d f8 9f STA $9ff8 ; (sstack + 2)
13c1 : a5 4f __ LDA T6 + 0 
13c3 : 8d f9 9f STA $9ff9 ; (sstack + 3)
13c6 : a5 50 __ LDA T7 + 0 
13c8 : 8d fa 9f STA $9ffa ; (sstack + 4)
13cb : a9 79 __ LDA #$79
13cd : 8d fb 9f STA $9ffb ; (sstack + 5)
13d0 : a9 9f __ LDA #$9f
13d2 : 8d fc 9f STA $9ffc ; (sstack + 6)
13d5 : 20 79 18 JSR $1879 ; (readSector.s4 + 0)
13d8 : a9 00 __ LDA #$00
13da : 85 13 __ STA P6 
13dc : 20 ba 17 JSR $17ba ; (printTimer.s4 + 0)
13df : ad ff 9f LDA $9fff ; (sstack + 9)
13e2 : f0 1c __ BEQ $1400 ; (copyDisk.s13 + 0)
.s17:
13e4 : 20 d1 19 JSR $19d1 ; (checkBufferEmpty.s4 + 0)
13e7 : aa __ __ TAX
13e8 : f0 16 __ BEQ $1400 ; (copyDisk.s13 + 0)
.s18:
13ea : a5 4b __ LDA T1 + 0 
13ec : 85 0d __ STA P0 
13ee : a5 4c __ LDA T2 + 0 
13f0 : 85 0e __ STA P1 
13f2 : a9 eb __ LDA #$eb
13f4 : 85 0f __ STA P2 
13f6 : a9 19 __ LDA #$19
13f8 : 85 10 __ STA P3 
13fa : 20 39 0c JSR $0c39 ; (putsxy.s4 + 0)
13fd : 4c 6b 13 JMP $136b ; (copyDisk.s15 + 0)
.s13:
1400 : 20 35 18 JSR $1835 ; (getchx.s4 + 0)
1403 : c9 53 __ CMP #$53
1405 : d0 09 __ BNE $1410 ; (copyDisk.s14 + 0)
.s16:
1407 : 20 b0 17 JSR $17b0 ; (closeCommandChannels.s4 + 0)
140a : 20 3f 18 JSR $183f ; (stopCiaTimer.s4 + 0)
140d : 4c 5a 13 JMP $135a ; (copyDisk.s20 + 0)
.s14:
1410 : a5 4b __ LDA T1 + 0 
1412 : 85 0d __ STA P0 
1414 : a5 4c __ LDA T2 + 0 
1416 : 85 0e __ STA P1 
1418 : a9 ed __ LDA #$ed
141a : 85 0f __ STA P2 
141c : a9 19 __ LDA #$19
141e : 85 10 __ STA P3 
1420 : 20 39 0c JSR $0c39 ; (putsxy.s4 + 0)
1423 : a5 4e __ LDA T5 + 0 
1425 : 8d f8 9f STA $9ff8 ; (sstack + 2)
1428 : a5 4f __ LDA T6 + 0 
142a : 8d f9 9f STA $9ff9 ; (sstack + 3)
142d : a5 50 __ LDA T7 + 0 
142f : 8d fa 9f STA $9ffa ; (sstack + 4)
1432 : a9 79 __ LDA #$79
1434 : 8d fb 9f STA $9ffb ; (sstack + 5)
1437 : a9 9f __ LDA #$9f
1439 : 8d fc 9f STA $9ffc ; (sstack + 6)
143c : 20 ef 19 JSR $19ef ; (writeSector.s4 + 0)
143f : a5 4b __ LDA T1 + 0 
1441 : 85 0d __ STA P0 
1443 : a5 4c __ LDA T2 + 0 
1445 : 85 0e __ STA P1 
1447 : a9 4b __ LDA #$4b
1449 : 85 0f __ STA P2 
144b : a9 1b __ LDA #$1b
144d : 85 10 __ STA P3 
144f : 20 39 0c JSR $0c39 ; (putsxy.s4 + 0)
1452 : 20 4d 1b JSR $1b4d ; (setNormalXY.s4 + 0)
1455 : 4c 6b 13 JMP $136b ; (copyDisk.s15 + 0)
--------------------------------------------------------------------
resetCiaTimer: ; resetCiaTimer()->void
.s4:
1458 : ad 95 1c LDA $1c95 ; (CIA1_TODH + 0)
145b : 85 1b __ STA ACCU + 0 
145d : ad 96 1c LDA $1c96 ; (CIA1_TODH + 1)
1460 : 85 1c __ STA ACCU + 1 
1462 : a9 0c __ LDA #$0c
1464 : a0 00 __ LDY #$00
1466 : 91 1b __ STA (ACCU + 0),y 
1468 : ad 97 1c LDA $1c97 ; (CIA1_TODM + 0)
146b : 85 1b __ STA ACCU + 0 
146d : ad 98 1c LDA $1c98 ; (CIA1_TODM + 1)
1470 : 85 1c __ STA ACCU + 1 
1472 : 98 __ __ TYA
1473 : 91 1b __ STA (ACCU + 0),y 
1475 : ae 99 1c LDX $1c99 ; (CIA1_TODS + 0)
1478 : 86 1b __ STX ACCU + 0 
147a : ae 9a 1c LDX $1c9a ; (CIA1_TODS + 1)
147d : 86 1c __ STX ACCU + 1 
147f : 91 1b __ STA (ACCU + 0),y 
1481 : ae 9b 1c LDX $1c9b ; (CIA1_TODT + 0)
1484 : 86 1b __ STX ACCU + 0 
1486 : ae 9c 1c LDX $1c9c ; (CIA1_TODT + 1)
1489 : 86 1c __ STX ACCU + 1 
148b : 91 1b __ STA (ACCU + 0),y 
.s3:
148d : 60 __ __ RTS
--------------------------------------------------------------------
openCommandCannels: ; openCommandCannels(u8,u8)->i16
.s4:
148e : a9 af __ LDA #$af
1490 : 85 0d __ STA P0 
1492 : a9 0f __ LDA #$0f
1494 : 85 0e __ STA P1 
1496 : 20 99 0f JSR $0f99 ; (krnio_setnam.s4 + 0)
1499 : a9 0f __ LDA #$0f
149b : 85 0d __ STA P0 
149d : 85 0f __ STA P2 
149f : a5 10 __ LDA P3 ; (src_drive + 0)
14a1 : 85 0e __ STA P1 
14a3 : 20 b0 0f JSR $0fb0 ; (krnio_open.s4 + 0)
14a6 : aa __ __ TAX
14a7 : d0 04 __ BNE $14ad ; (openCommandCannels.s6 + 0)
.s5:
14a9 : a9 ff __ LDA #$ff
14ab : d0 20 __ BNE $14cd ; (openCommandCannels.s3 + 0)
.s6:
14ad : a9 af __ LDA #$af
14af : 85 0d __ STA P0 
14b1 : a9 0f __ LDA #$0f
14b3 : 85 0e __ STA P1 
14b5 : 20 99 0f JSR $0f99 ; (krnio_setnam.s4 + 0)
14b8 : a5 11 __ LDA P4 ; (dest_drive + 0)
14ba : 85 0e __ STA P1 
14bc : a9 10 __ LDA #$10
14be : 85 0d __ STA P0 
14c0 : a9 0f __ LDA #$0f
14c2 : 85 0f __ STA P2 
14c4 : 20 b0 0f JSR $0fb0 ; (krnio_open.s4 + 0)
14c7 : c9 01 __ CMP #$01
14c9 : a9 00 __ LDA #$00
14cb : 69 ff __ ADC #$ff
.s3:
14cd : 85 1b __ STA ACCU + 0 
14cf : 85 1c __ STA ACCU + 1 
14d1 : 60 __ __ RTS
--------------------------------------------------------------------
changeBusSpeed: ; changeBusSpeed()->i16
.s4:
14d2 : a9 4d __ LDA #$4d
14d4 : 8d 9a 9f STA $9f9a ; (cmd2 + 0)
14d7 : 8d a0 9f STA $9fa0 ; (cmd + 0)
14da : a9 2d __ LDA #$2d
14dc : 8d 9b 9f STA $9f9b ; (cmd2 + 1)
14df : 8d a1 9f STA $9fa1 ; (cmd + 1)
14e2 : a9 06 __ LDA #$06
14e4 : 85 11 __ STA P4 
14e6 : 8d 9d 9f STA $9f9d ; (cmd2 + 3)
14e9 : 8d a3 9f STA $9fa3 ; (cmd + 3)
14ec : a9 52 __ LDA #$52
14ee : 8d 9c 9f STA $9f9c ; (cmd2 + 2)
14f1 : a9 18 __ LDA #$18
14f3 : 8d 9e 9f STA $9f9e ; (cmd2 + 4)
14f6 : 8d a4 9f STA $9fa4 ; (cmd + 4)
14f9 : a9 02 __ LDA #$02
14fb : 8d 9f 9f STA $9f9f ; (cmd2 + 5)
14fe : 8d a5 9f STA $9fa5 ; (cmd + 5)
1501 : a9 57 __ LDA #$57
1503 : 8d a2 9f STA $9fa2 ; (cmd + 2)
1506 : a9 aa __ LDA #$aa
1508 : 8d a6 9f STA $9fa6 ; (cmd + 6)
150b : a9 01 __ LDA #$01
150d : 8d a7 9f STA $9fa7 ; (cmd + 7)
1510 : a9 0f __ LDA #$0f
1512 : 85 0e __ STA P1 
1514 : a9 9f __ LDA #$9f
1516 : 85 10 __ STA P3 
1518 : a9 00 __ LDA #$00
151a : 85 12 __ STA P5 
151c : a9 9a __ LDA #$9a
151e : 85 0f __ STA P2 
1520 : 20 62 17 JSR $1762 ; (krnio_write.s4 + 0)
1523 : a5 1c __ LDA ACCU + 1 
1525 : 10 03 __ BPL $152a ; (changeBusSpeed.s28 + 0)
1527 : 4c 51 17 JMP $1751 ; (changeBusSpeed.s16 + 0)
.s28:
152a : 05 1b __ ORA ACCU + 0 
152c : f0 f9 __ BEQ $1527 ; (changeBusSpeed.s4 + 85)
.s5:
152e : a9 0f __ LDA #$0f
1530 : 85 0e __ STA P1 
1532 : a9 9f __ LDA #$9f
1534 : 85 10 __ STA P3 
1536 : a9 02 __ LDA #$02
1538 : 85 11 __ STA P4 
153a : a9 ca __ LDA #$ca
153c : 85 0f __ STA P2 
153e : 20 53 10 JSR $1053 ; (krnio_read.s4 + 0)
1541 : a5 1c __ LDA ACCU + 1 
1543 : 30 e2 __ BMI $1527 ; (changeBusSpeed.s4 + 85)
.s27:
1545 : 05 1b __ ORA ACCU + 0 
1547 : f0 de __ BEQ $1527 ; (changeBusSpeed.s4 + 85)
.s6:
1549 : a9 a8 __ LDA #$a8
154b : 85 0d __ STA P0 
154d : a9 0f __ LDA #$0f
154f : 85 10 __ STA P3 
1551 : a9 9f __ LDA #$9f
1553 : 85 0e __ STA P1 
1555 : a9 af __ LDA #$af
1557 : 85 0f __ STA P2 
1559 : 20 ab 0d JSR $0dab ; (set_sstr.s4 + 0)
155c : ad cb 9f LDA $9fcb ; (buf + 1)
155f : 85 16 __ STA P9 
1561 : a9 a8 __ LDA #$a8
1563 : 85 13 __ STA P6 
1565 : a9 9f __ LDA #$9f
1567 : 85 14 __ STA P7 
1569 : ad ca 9f LDA $9fca ; (buf + 0)
156c : 85 15 __ STA P8 
156e : 20 ce 0d JSR $0dce ; (append_sstr_num.s4 + 0)
1571 : a9 00 __ LDA #$00
1573 : 85 0d __ STA P0 
1575 : 85 0e __ STA P1 
1577 : a9 a9 __ LDA #$a9
1579 : 85 0f __ STA P2 
157b : a9 9f __ LDA #$9f
157d : 85 10 __ STA P3 
157f : 20 39 0c JSR $0c39 ; (putsxy.s4 + 0)
1582 : a9 0f __ LDA #$0f
1584 : 85 0e __ STA P1 
1586 : a9 9f __ LDA #$9f
1588 : 85 10 __ STA P3 
158a : a9 08 __ LDA #$08
158c : 85 11 __ STA P4 
158e : a9 00 __ LDA #$00
1590 : 85 12 __ STA P5 
1592 : a9 a0 __ LDA #$a0
1594 : 85 0f __ STA P2 
1596 : 20 62 17 JSR $1762 ; (krnio_write.s4 + 0)
1599 : a5 1c __ LDA ACCU + 1 
159b : 30 8a __ BMI $1527 ; (changeBusSpeed.s4 + 85)
.s26:
159d : 05 1b __ ORA ACCU + 0 
159f : f0 86 __ BEQ $1527 ; (changeBusSpeed.s4 + 85)
.s7:
15a1 : a9 0f __ LDA #$0f
15a3 : 85 0e __ STA P1 
15a5 : a9 06 __ LDA #$06
15a7 : 85 11 __ STA P4 
15a9 : a9 9a __ LDA #$9a
15ab : 85 0f __ STA P2 
15ad : a9 9f __ LDA #$9f
15af : 85 10 __ STA P3 
15b1 : 20 62 17 JSR $1762 ; (krnio_write.s4 + 0)
15b4 : a5 1c __ LDA ACCU + 1 
15b6 : 10 03 __ BPL $15bb ; (changeBusSpeed.s25 + 0)
15b8 : 4c 51 17 JMP $1751 ; (changeBusSpeed.s16 + 0)
.s25:
15bb : 05 1b __ ORA ACCU + 0 
15bd : f0 f9 __ BEQ $15b8 ; (changeBusSpeed.s7 + 23)
.s8:
15bf : a9 0f __ LDA #$0f
15c1 : 85 0e __ STA P1 
15c3 : a9 02 __ LDA #$02
15c5 : 85 11 __ STA P4 
15c7 : a9 ca __ LDA #$ca
15c9 : 85 0f __ STA P2 
15cb : a9 9f __ LDA #$9f
15cd : 85 10 __ STA P3 
15cf : 20 53 10 JSR $1053 ; (krnio_read.s4 + 0)
15d2 : a5 1c __ LDA ACCU + 1 
15d4 : 30 e2 __ BMI $15b8 ; (changeBusSpeed.s7 + 23)
.s24:
15d6 : 05 1b __ ORA ACCU + 0 
15d8 : f0 de __ BEQ $15b8 ; (changeBusSpeed.s7 + 23)
.s9:
15da : a9 a8 __ LDA #$a8
15dc : 85 0d __ STA P0 
15de : a9 0f __ LDA #$0f
15e0 : 85 10 __ STA P3 
15e2 : a9 9f __ LDA #$9f
15e4 : 85 0e __ STA P1 
15e6 : a9 af __ LDA #$af
15e8 : 85 0f __ STA P2 
15ea : 20 ab 0d JSR $0dab ; (set_sstr.s4 + 0)
15ed : ad cb 9f LDA $9fcb ; (buf + 1)
15f0 : 85 16 __ STA P9 
15f2 : ad ca 9f LDA $9fca ; (buf + 0)
15f5 : 85 15 __ STA P8 
15f7 : 20 ce 0d JSR $0dce ; (append_sstr_num.s4 + 0)
15fa : a9 00 __ LDA #$00
15fc : 85 0d __ STA P0 
15fe : a9 9f __ LDA #$9f
1600 : 85 10 __ STA P3 
1602 : a9 01 __ LDA #$01
1604 : 85 0e __ STA P1 
1606 : a9 a9 __ LDA #$a9
1608 : 85 0f __ STA P2 
160a : 20 39 0c JSR $0c39 ; (putsxy.s4 + 0)
160d : a9 10 __ LDA #$10
160f : 85 0e __ STA P1 
1611 : a9 00 __ LDA #$00
1613 : 85 12 __ STA P5 
1615 : a9 a0 __ LDA #$a0
1617 : 85 0f __ STA P2 
1619 : a9 9f __ LDA #$9f
161b : 85 10 __ STA P3 
161d : a9 08 __ LDA #$08
161f : 85 11 __ STA P4 
1621 : 20 62 17 JSR $1762 ; (krnio_write.s4 + 0)
1624 : a5 1c __ LDA ACCU + 1 
1626 : 30 90 __ BMI $15b8 ; (changeBusSpeed.s7 + 23)
.s23:
1628 : 05 1b __ ORA ACCU + 0 
162a : f0 8c __ BEQ $15b8 ; (changeBusSpeed.s7 + 23)
.s10:
162c : a9 06 __ LDA #$06
162e : 85 11 __ STA P4 
1630 : 8d 9d 9f STA $9f9d ; (cmd2 + 3)
1633 : 8d a3 9f STA $9fa3 ; (cmd + 3)
1636 : a9 1c __ LDA #$1c
1638 : 8d 9e 9f STA $9f9e ; (cmd2 + 4)
163b : 8d a4 9f STA $9fa4 ; (cmd + 4)
163e : a9 0f __ LDA #$0f
1640 : 8d a7 9f STA $9fa7 ; (cmd + 7)
1643 : 85 0e __ STA P1 
1645 : a9 3a __ LDA #$3a
1647 : 8d a6 9f STA $9fa6 ; (cmd + 6)
164a : a9 9a __ LDA #$9a
164c : 85 0f __ STA P2 
164e : a9 9f __ LDA #$9f
1650 : 85 10 __ STA P3 
1652 : 20 62 17 JSR $1762 ; (krnio_write.s4 + 0)
1655 : a5 1c __ LDA ACCU + 1 
1657 : 10 03 __ BPL $165c ; (changeBusSpeed.s22 + 0)
1659 : 4c 51 17 JMP $1751 ; (changeBusSpeed.s16 + 0)
.s22:
165c : 05 1b __ ORA ACCU + 0 
165e : f0 f9 __ BEQ $1659 ; (changeBusSpeed.s10 + 45)
.s11:
1660 : a9 0f __ LDA #$0f
1662 : 85 0e __ STA P1 
1664 : a9 02 __ LDA #$02
1666 : 85 11 __ STA P4 
1668 : a9 ca __ LDA #$ca
166a : 85 0f __ STA P2 
166c : a9 9f __ LDA #$9f
166e : 85 10 __ STA P3 
1670 : 20 53 10 JSR $1053 ; (krnio_read.s4 + 0)
1673 : a5 1c __ LDA ACCU + 1 
1675 : 30 e2 __ BMI $1659 ; (changeBusSpeed.s10 + 45)
.s21:
1677 : 05 1b __ ORA ACCU + 0 
1679 : f0 de __ BEQ $1659 ; (changeBusSpeed.s10 + 45)
.s12:
167b : a9 a8 __ LDA #$a8
167d : 85 0d __ STA P0 
167f : a9 0f __ LDA #$0f
1681 : 85 10 __ STA P3 
1683 : a9 9f __ LDA #$9f
1685 : 85 0e __ STA P1 
1687 : a9 af __ LDA #$af
1689 : 85 0f __ STA P2 
168b : 20 ab 0d JSR $0dab ; (set_sstr.s4 + 0)
168e : ad cb 9f LDA $9fcb ; (buf + 1)
1691 : 85 16 __ STA P9 
1693 : ad ca 9f LDA $9fca ; (buf + 0)
1696 : 85 15 __ STA P8 
1698 : 20 ce 0d JSR $0dce ; (append_sstr_num.s4 + 0)
169b : a9 00 __ LDA #$00
169d : 85 0d __ STA P0 
169f : a9 9f __ LDA #$9f
16a1 : 85 10 __ STA P3 
16a3 : a9 02 __ LDA #$02
16a5 : 85 0e __ STA P1 
16a7 : a9 a9 __ LDA #$a9
16a9 : 85 0f __ STA P2 
16ab : 20 39 0c JSR $0c39 ; (putsxy.s4 + 0)
16ae : a9 0f __ LDA #$0f
16b0 : 85 0e __ STA P1 
16b2 : a9 00 __ LDA #$00
16b4 : 85 12 __ STA P5 
16b6 : a9 a0 __ LDA #$a0
16b8 : 85 0f __ STA P2 
16ba : a9 9f __ LDA #$9f
16bc : 85 10 __ STA P3 
16be : a9 08 __ LDA #$08
16c0 : 85 11 __ STA P4 
16c2 : 20 62 17 JSR $1762 ; (krnio_write.s4 + 0)
16c5 : a5 1c __ LDA ACCU + 1 
16c7 : 30 90 __ BMI $1659 ; (changeBusSpeed.s10 + 45)
.s20:
16c9 : 05 1b __ ORA ACCU + 0 
16cb : f0 8c __ BEQ $1659 ; (changeBusSpeed.s10 + 45)
.s13:
16cd : a9 0f __ LDA #$0f
16cf : 85 0e __ STA P1 
16d1 : a9 06 __ LDA #$06
16d3 : 85 11 __ STA P4 
16d5 : a9 9a __ LDA #$9a
16d7 : 85 0f __ STA P2 
16d9 : a9 9f __ LDA #$9f
16db : 85 10 __ STA P3 
16dd : 20 62 17 JSR $1762 ; (krnio_write.s4 + 0)
16e0 : a5 1c __ LDA ACCU + 1 
16e2 : 30 6d __ BMI $1751 ; (changeBusSpeed.s16 + 0)
.s19:
16e4 : 05 1b __ ORA ACCU + 0 
16e6 : f0 69 __ BEQ $1751 ; (changeBusSpeed.s16 + 0)
.s14:
16e8 : a9 0f __ LDA #$0f
16ea : 85 0e __ STA P1 
16ec : a9 02 __ LDA #$02
16ee : 85 11 __ STA P4 
16f0 : a9 ca __ LDA #$ca
16f2 : 85 0f __ STA P2 
16f4 : a9 9f __ LDA #$9f
16f6 : 85 10 __ STA P3 
16f8 : 20 53 10 JSR $1053 ; (krnio_read.s4 + 0)
16fb : a5 1c __ LDA ACCU + 1 
16fd : 30 52 __ BMI $1751 ; (changeBusSpeed.s16 + 0)
.s18:
16ff : 05 1b __ ORA ACCU + 0 
1701 : f0 4e __ BEQ $1751 ; (changeBusSpeed.s16 + 0)
.s15:
1703 : a9 a8 __ LDA #$a8
1705 : 85 0d __ STA P0 
1707 : a9 0f __ LDA #$0f
1709 : 85 10 __ STA P3 
170b : a9 9f __ LDA #$9f
170d : 85 0e __ STA P1 
170f : a9 af __ LDA #$af
1711 : 85 0f __ STA P2 
1713 : 20 ab 0d JSR $0dab ; (set_sstr.s4 + 0)
1716 : ad cb 9f LDA $9fcb ; (buf + 1)
1719 : 85 16 __ STA P9 
171b : ad ca 9f LDA $9fca ; (buf + 0)
171e : 85 15 __ STA P8 
1720 : 20 ce 0d JSR $0dce ; (append_sstr_num.s4 + 0)
1723 : a9 00 __ LDA #$00
1725 : 85 0d __ STA P0 
1727 : a9 9f __ LDA #$9f
1729 : 85 10 __ STA P3 
172b : a9 03 __ LDA #$03
172d : 85 0e __ STA P1 
172f : a9 a9 __ LDA #$a9
1731 : 85 0f __ STA P2 
1733 : 20 39 0c JSR $0c39 ; (putsxy.s4 + 0)
1736 : a9 10 __ LDA #$10
1738 : 85 0e __ STA P1 
173a : a9 00 __ LDA #$00
173c : 85 12 __ STA P5 
173e : a9 a0 __ LDA #$a0
1740 : 85 0f __ STA P2 
1742 : a9 9f __ LDA #$9f
1744 : 85 10 __ STA P3 
1746 : a9 08 __ LDA #$08
1748 : 85 11 __ STA P4 
174a : 20 62 17 JSR $1762 ; (krnio_write.s4 + 0)
174d : a5 1c __ LDA ACCU + 1 
174f : 10 04 __ BPL $1755 ; (changeBusSpeed.s17 + 0)
.s16:
1751 : a9 ff __ LDA #$ff
1753 : d0 08 __ BNE $175d ; (changeBusSpeed.s3 + 0)
.s17:
1755 : 05 1b __ ORA ACCU + 0 
1757 : c9 01 __ CMP #$01
1759 : a9 00 __ LDA #$00
175b : 69 ff __ ADC #$ff
.s3:
175d : 85 1b __ STA ACCU + 0 
175f : 85 1c __ STA ACCU + 1 
1761 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_write: ; krnio_write(u8,const u8*,i16)->i16
.s4:
1762 : a5 0e __ LDA P1 ; (fnum + 0)
1764 : 20 1f 10 JSR $101f ; (krnio_chkout.s4 + 0)
1767 : aa __ __ TAX
1768 : d0 07 __ BNE $1771 ; (krnio_write.s6 + 0)
.s5:
176a : a9 ff __ LDA #$ff
176c : 85 1b __ STA ACCU + 0 
.s3:
176e : 85 1c __ STA ACCU + 1 
1770 : 60 __ __ RTS
.s6:
1771 : a5 12 __ LDA P5 ; (num + 1)
1773 : 30 2f __ BMI $17a4 ; (krnio_write.s7 + 0)
.s10:
1775 : 05 11 __ ORA P4 ; (num + 0)
1777 : f0 2b __ BEQ $17a4 ; (krnio_write.s7 + 0)
.s8:
1779 : a5 11 __ LDA P4 ; (num + 0)
177b : 85 43 __ STA T1 + 0 
177d : a5 12 __ LDA P5 ; (num + 1)
177f : 85 44 __ STA T1 + 1 
1781 : a5 0f __ LDA P2 ; (data + 0)
1783 : 85 45 __ STA T2 + 0 
1785 : a5 10 __ LDA P3 ; (data + 1)
1787 : 85 46 __ STA T2 + 1 
.l9:
1789 : a0 00 __ LDY #$00
178b : b1 45 __ LDA (T2 + 0),y 
178d : 20 34 10 JSR $1034 ; (krnio_chrout.s4 + 0)
1790 : e6 45 __ INC T2 + 0 
1792 : d0 02 __ BNE $1796 ; (krnio_write.s12 + 0)
.s11:
1794 : e6 46 __ INC T2 + 1 
.s12:
1796 : a5 43 __ LDA T1 + 0 
1798 : d0 02 __ BNE $179c ; (krnio_write.s14 + 0)
.s13:
179a : c6 44 __ DEC T1 + 1 
.s14:
179c : c6 43 __ DEC T1 + 0 
179e : d0 e9 __ BNE $1789 ; (krnio_write.l9 + 0)
.s15:
17a0 : a5 44 __ LDA T1 + 1 
17a2 : d0 e5 __ BNE $1789 ; (krnio_write.l9 + 0)
.s7:
17a4 : 20 44 10 JSR $1044 ; (krnio_clrchn.s4 + 0)
17a7 : a5 11 __ LDA P4 ; (num + 0)
17a9 : 85 1b __ STA ACCU + 0 
17ab : a5 12 __ LDA P5 ; (num + 1)
17ad : 4c 6e 17 JMP $176e ; (krnio_write.s3 + 0)
--------------------------------------------------------------------
closeCommandChannels: ; closeCommandChannels()->void
.s4:
17b0 : a9 10 __ LDA #$10
17b2 : 20 4b 10 JSR $104b ; (krnio_close.s4 + 0)
17b5 : a9 0f __ LDA #$0f
17b7 : 4c 4b 10 JMP $104b ; (krnio_close.s4 + 0)
--------------------------------------------------------------------
printTimer: ; printTimer(u8)->void
.s4:
17ba : a9 ce __ LDA #$ce
17bc : 85 11 __ STA P4 
17be : a9 9f __ LDA #$9f
17c0 : 85 12 __ STA P5 
17c2 : 20 d8 17 JSR $17d8 ; (getCiaTimer.s4 + 0)
17c5 : a5 13 __ LDA P6 ; (ypos + 0)
17c7 : 85 0e __ STA P1 
17c9 : a9 23 __ LDA #$23
17cb : 85 0d __ STA P0 
17cd : a9 cf __ LDA #$cf
17cf : 85 0f __ STA P2 
17d1 : a9 9f __ LDA #$9f
17d3 : 85 10 __ STA P3 
17d5 : 4c 39 0c JMP $0c39 ; (putsxy.s4 + 0)
--------------------------------------------------------------------
getCiaTimer: ; getCiaTimer(struct sstr*)->void
.s4:
17d8 : a2 05 __ LDX #$05
.l5:
17da : bd 9d 1c LDA $1c9d,x 
17dd : 9d f0 9f STA $9ff0,x ; (timerStr + 0)
17e0 : ca __ __ DEX
17e1 : 10 f7 __ BPL $17da ; (getCiaTimer.l5 + 0)
.s6:
17e3 : ad 99 1c LDA $1c99 ; (CIA1_TODS + 0)
17e6 : 85 43 __ STA T0 + 0 
17e8 : ad 9a 1c LDA $1c9a ; (CIA1_TODS + 1)
17eb : 85 44 __ STA T0 + 1 
17ed : a0 00 __ LDY #$00
17ef : b1 43 __ LDA (T0 + 0),y 
17f1 : aa __ __ TAX
17f2 : ad 97 1c LDA $1c97 ; (CIA1_TODM + 0)
17f5 : 85 43 __ STA T0 + 0 
17f7 : ad 98 1c LDA $1c98 ; (CIA1_TODM + 1)
17fa : 85 44 __ STA T0 + 1 
17fc : b1 43 __ LDA (T0 + 0),y 
17fe : a8 __ __ TAY
17ff : 4a __ __ LSR
1800 : 4a __ __ LSR
1801 : 4a __ __ LSR
1802 : 4a __ __ LSR
1803 : 09 30 __ ORA #$30
1805 : 8d f0 9f STA $9ff0 ; (timerStr + 0)
1808 : 98 __ __ TYA
1809 : 29 0f __ AND #$0f
180b : 09 30 __ ORA #$30
180d : 8d f1 9f STA $9ff1 ; (timerStr + 1)
1810 : 8a __ __ TXA
1811 : 4a __ __ LSR
1812 : 4a __ __ LSR
1813 : 4a __ __ LSR
1814 : 4a __ __ LSR
1815 : 09 30 __ ORA #$30
1817 : 8d f3 9f STA $9ff3 ; (timerStr + 3)
181a : 8a __ __ TXA
181b : 29 0f __ AND #$0f
181d : 09 30 __ ORA #$30
181f : 8d f4 9f STA $9ff4 ; (timerStr + 4)
1822 : a5 11 __ LDA P4 ; (tmpstr + 0)
1824 : 85 0d __ STA P0 
1826 : a5 12 __ LDA P5 ; (tmpstr + 1)
1828 : 85 0e __ STA P1 
182a : a9 f0 __ LDA #$f0
182c : 85 0f __ STA P2 
182e : a9 9f __ LDA #$9f
1830 : 85 10 __ STA P3 
1832 : 4c ab 0d JMP $0dab ; (set_sstr.s4 + 0)
--------------------------------------------------------------------
getchx: ; getchx()->u8
.s4:
1835 : 20 e4 ff JSR $ffe4 
1838 : 85 1b __ STA ACCU + 0 
183a : a5 1b __ LDA ACCU + 0 
183c : 4c e7 0e JMP $0ee7 ; (convch.s4 + 0)
--------------------------------------------------------------------
stopCiaTimer: ; stopCiaTimer()->void
.s4:
183f : ad 95 1c LDA $1c95 ; (CIA1_TODH + 0)
1842 : 85 1b __ STA ACCU + 0 
1844 : ad 96 1c LDA $1c96 ; (CIA1_TODH + 1)
1847 : 85 1c __ STA ACCU + 1 
1849 : a9 0c __ LDA #$0c
184b : a0 00 __ LDY #$00
184d : 91 1b __ STA (ACCU + 0),y 
.s3:
184f : 60 __ __ RTS
--------------------------------------------------------------------
setAccentXY: ; setAccentXY(u8,u8)->void
.s4:
1850 : a5 0e __ LDA P1 ; (y + 0)
1852 : 0a __ __ ASL
1853 : 85 1b __ STA ACCU + 0 
1855 : a9 00 __ LDA #$00
1857 : 2a __ __ ROL
1858 : 06 1b __ ASL ACCU + 0 
185a : 2a __ __ ROL
185b : aa __ __ TAX
185c : a5 1b __ LDA ACCU + 0 
185e : 65 0e __ ADC P1 ; (y + 0)
1860 : 85 1b __ STA ACCU + 0 
1862 : 8a __ __ TXA
1863 : 69 00 __ ADC #$00
1865 : 06 1b __ ASL ACCU + 0 
1867 : 2a __ __ ROL
1868 : 06 1b __ ASL ACCU + 0 
186a : 2a __ __ ROL
186b : 06 1b __ ASL ACCU + 0 
186d : 2a __ __ ROL
186e : 69 d8 __ ADC #$d8
1870 : 85 1c __ STA ACCU + 1 
1872 : a9 03 __ LDA #$03
1874 : a4 0d __ LDY P0 ; (x + 0)
1876 : 91 1b __ STA (ACCU + 0),y 
.s3:
1878 : 60 __ __ RTS
--------------------------------------------------------------------
readSector: ; readSector(u8,u8,u8,struct sstr*)->i16
.s4:
1879 : a9 05 __ LDA #$05
187b : 85 10 __ STA P3 
187d : 85 11 __ STA P4 
187f : ad f8 9f LDA $9ff8 ; (sstack + 2)
1882 : 85 12 __ STA P5 
1884 : 20 ba 18 JSR $18ba ; (openBufferChannel.s4 + 0)
1887 : 24 1c __ BIT ACCU + 1 ; (track + 0)
1889 : 30 24 __ BMI $18af ; (readSector.s8 + 0)
.s5:
188b : ad f9 9f LDA $9ff9 ; (sstack + 3)
188e : 85 17 __ STA P10 
1890 : ad fa 9f LDA $9ffa ; (sstack + 4)
1893 : 85 18 __ STA P11 
1895 : ad fb 9f LDA $9ffb ; (sstack + 5)
1898 : 8d f6 9f STA $9ff6 ; (sstack + 0)
189b : ad fc 9f LDA $9ffc ; (sstack + 6)
189e : 8d f7 9f STA $9ff7 ; (sstack + 1)
18a1 : 20 df 18 JSR $18df ; (loadSectorToBuffer.s4 + 0)
18a4 : 24 1c __ BIT ACCU + 1 ; (track + 0)
18a6 : 30 07 __ BMI $18af ; (readSector.s8 + 0)
.s6:
18a8 : 20 a2 19 JSR $19a2 ; (readBufferToMem.s4 + 0)
18ab : 24 1c __ BIT ACCU + 1 ; (track + 0)
18ad : 10 04 __ BPL $18b3 ; (readSector.s7 + 0)
.s8:
18af : a9 ff __ LDA #$ff
18b1 : d0 02 __ BNE $18b5 ; (readSector.s3 + 0)
.s7:
18b3 : a9 00 __ LDA #$00
.s3:
18b5 : 85 1b __ STA ACCU + 0 ; (driveid + 0)
18b7 : 85 1c __ STA ACCU + 1 ; (track + 0)
18b9 : 60 __ __ RTS
--------------------------------------------------------------------
openBufferChannel: ; openBufferChannel(u8,u8,u8)->i16
.s4:
18ba : a9 fe __ LDA #$fe
18bc : 85 0d __ STA P0 
18be : a9 12 __ LDA #$12
18c0 : 85 0e __ STA P1 
18c2 : 20 99 0f JSR $0f99 ; (krnio_setnam.s4 + 0)
18c5 : a5 10 __ LDA P3 ; (file_handle_buff + 0)
18c7 : 85 0d __ STA P0 
18c9 : a5 12 __ LDA P5 ; (driveid + 0)
18cb : 85 0e __ STA P1 
18cd : a5 11 __ LDA P4 ; (ch_num + 0)
18cf : 85 0f __ STA P2 
18d1 : 20 b0 0f JSR $0fb0 ; (krnio_open.s4 + 0)
18d4 : c9 01 __ CMP #$01
18d6 : a9 00 __ LDA #$00
18d8 : 69 ff __ ADC #$ff
.s3:
18da : 85 1b __ STA ACCU + 0 
18dc : 85 1c __ STA ACCU + 1 
18de : 60 __ __ RTS
--------------------------------------------------------------------
loadSectorToBuffer: ; loadSectorToBuffer(u8,u8,struct sstr*)->i16
.s4:
18df : a9 c8 __ LDA #$c8
18e1 : 85 0d __ STA P0 
18e3 : a9 19 __ LDA #$19
18e5 : 85 10 __ STA P3 
18e7 : a9 9f __ LDA #$9f
18e9 : 85 0e __ STA P1 
18eb : a9 4f __ LDA #$4f
18ed : 85 0f __ STA P2 
18ef : 20 ab 0d JSR $0dab ; (set_sstr.s4 + 0)
18f2 : a5 17 __ LDA P10 ; (track + 0)
18f4 : 85 15 __ STA P8 
18f6 : a9 c8 __ LDA #$c8
18f8 : 85 13 __ STA P6 
18fa : a9 9f __ LDA #$9f
18fc : 85 14 __ STA P7 
18fe : a9 00 __ LDA #$00
1900 : 85 16 __ STA P9 
1902 : 20 ce 0d JSR $0dce ; (append_sstr_num.s4 + 0)
1905 : a9 c8 __ LDA #$c8
1907 : 85 0d __ STA P0 
1909 : a9 19 __ LDA #$19
190b : 85 10 __ STA P3 
190d : a9 9f __ LDA #$9f
190f : 85 0e __ STA P1 
1911 : a9 57 __ LDA #$57
1913 : 85 0f __ STA P2 
1915 : 20 9d 0e JSR $0e9d ; (append_sstr.s4 + 0)
1918 : a5 18 __ LDA P11 ; (sec + 0)
191a : 85 15 __ STA P8 
191c : 20 ce 0d JSR $0dce ; (append_sstr_num.s4 + 0)
191f : a9 0f __ LDA #$0f
1921 : 85 0e __ STA P1 
1923 : a9 9f __ LDA #$9f
1925 : 85 10 __ STA P3 
1927 : a9 c9 __ LDA #$c9
1929 : 85 0f __ STA P2 
192b : 20 de 0f JSR $0fde ; (krnio_puts.s4 + 0)
192e : a5 1c __ LDA ACCU + 1 
1930 : 30 11 __ BMI $1943 ; (loadSectorToBuffer.s6 + 0)
.s7:
1932 : 05 1b __ ORA ACCU + 0 
1934 : f0 0d __ BEQ $1943 ; (loadSectorToBuffer.s6 + 0)
.s5:
1936 : ad f6 9f LDA $9ff6 ; (sstack + 0)
1939 : 85 13 __ STA P6 
193b : ad f7 9f LDA $9ff7 ; (sstack + 1)
193e : 85 14 __ STA P7 
1940 : 4c 59 19 JMP $1959 ; (waitForReadStatus.s4 + 0)
.s6:
1943 : a9 05 __ LDA #$05
1945 : 20 4b 10 JSR $104b ; (krnio_close.s4 + 0)
1948 : a9 ff __ LDA #$ff
194a : 85 1b __ STA ACCU + 0 
194c : 85 1c __ STA ACCU + 1 
.s3:
194e : 60 __ __ RTS
--------------------------------------------------------------------
194f : __ __ __ BYT 55 31 20 35 20 30 20 00                         : U1 5 0 .
--------------------------------------------------------------------
1957 : __ __ __ BYT 20 00                                           :  .
--------------------------------------------------------------------
waitForReadStatus: ; waitForReadStatus(struct sstr*)->i16
.s4:
1959 : a9 0f __ LDA #$0f
195b : 85 0e __ STA P1 
195d : a9 10 __ LDA #$10
195f : 85 11 __ STA P4 
1961 : a9 00 __ LDA #$00
1963 : 85 12 __ STA P5 
1965 : 18 __ __ CLC
1966 : a5 13 __ LDA P6 ; (status_str + 0)
1968 : 69 01 __ ADC #$01
196a : 85 0f __ STA P2 
196c : a5 14 __ LDA P7 ; (status_str + 1)
196e : 69 00 __ ADC #$00
1970 : 85 10 __ STA P3 
1972 : 20 53 10 JSR $1053 ; (krnio_read.s4 + 0)
1975 : a9 00 __ LDA #$00
1977 : a0 10 __ LDY #$10
1979 : 91 13 __ STA (P6),y ; (status_str + 0)
197b : a5 0f __ LDA P2 
197d : 85 0d __ STA P0 
197f : a5 10 __ LDA P3 
1981 : 85 0e __ STA P1 
1983 : 20 f2 10 JSR $10f2 ; (atoi.l4 + 0)
1986 : a5 1c __ LDA ACCU + 1 
1988 : 30 08 __ BMI $1992 ; (waitForReadStatus.s5 + 0)
.s8:
198a : d0 0a __ BNE $1996 ; (waitForReadStatus.s6 + 0)
.s7:
198c : a5 1b __ LDA ACCU + 0 
198e : c9 14 __ CMP #$14
1990 : b0 04 __ BCS $1996 ; (waitForReadStatus.s6 + 0)
.s5:
1992 : a9 00 __ LDA #$00
1994 : f0 07 __ BEQ $199d ; (waitForReadStatus.s3 + 0)
.s6:
1996 : a9 05 __ LDA #$05
1998 : 20 4b 10 JSR $104b ; (krnio_close.s4 + 0)
199b : a9 ff __ LDA #$ff
.s3:
199d : 85 1b __ STA ACCU + 0 
199f : 85 1c __ STA ACCU + 1 
19a1 : 60 __ __ RTS
--------------------------------------------------------------------
readBufferToMem: ; readBufferToMem()->i16
.s4:
19a2 : a9 05 __ LDA #$05
19a4 : 85 0e __ STA P1 
19a6 : a9 1d __ LDA #$1d
19a8 : 85 10 __ STA P3 
19aa : a9 00 __ LDA #$00
19ac : 85 11 __ STA P4 
19ae : a9 01 __ LDA #$01
19b0 : 85 12 __ STA P5 
19b2 : a9 00 __ LDA #$00
19b4 : 85 0f __ STA P2 
19b6 : 20 53 10 JSR $1053 ; (krnio_read.s4 + 0)
19b9 : a5 1c __ LDA ACCU + 1 
19bb : 85 48 __ STA T0 + 1 
19bd : a9 05 __ LDA #$05
19bf : 20 4b 10 JSR $104b ; (krnio_close.s4 + 0)
19c2 : 24 48 __ BIT T0 + 1 
19c4 : 10 04 __ BPL $19ca ; (readBufferToMem.s5 + 0)
.s6:
19c6 : a9 ff __ LDA #$ff
19c8 : d0 02 __ BNE $19cc ; (readBufferToMem.s3 + 0)
.s5:
19ca : a9 00 __ LDA #$00
.s3:
19cc : 85 1b __ STA ACCU + 0 
19ce : 85 1c __ STA ACCU + 1 
19d0 : 60 __ __ RTS
--------------------------------------------------------------------
checkBufferEmpty: ; checkBufferEmpty()->bool
.s4:
19d1 : ad 00 1d LDA $1d00 ; (buffer + 0)
19d4 : d0 0f __ BNE $19e5 ; (checkBufferEmpty.s9 + 0)
.s5:
19d6 : a0 01 __ LDY #$01
19d8 : ad 01 1d LDA $1d01 ; (buffer + 1)
19db : d0 08 __ BNE $19e5 ; (checkBufferEmpty.s9 + 0)
.l6:
19dd : c8 __ __ INY
19de : f0 08 __ BEQ $19e8 ; (checkBufferEmpty.s7 + 0)
.s8:
19e0 : b9 00 1d LDA $1d00,y ; (buffer + 0)
19e3 : f0 f8 __ BEQ $19dd ; (checkBufferEmpty.l6 + 0)
.s9:
19e5 : a9 00 __ LDA #$00
.s3:
19e7 : 60 __ __ RTS
.s7:
19e8 : a9 01 __ LDA #$01
19ea : 60 __ __ RTS
--------------------------------------------------------------------
19eb : __ __ __ BYT 4f 00                                           : O.
--------------------------------------------------------------------
19ed : __ __ __ BYT 57 00                                           : W.
--------------------------------------------------------------------
writeSector: ; writeSector(u8,u8,u8,struct sstr*)->i16
.s4:
19ef : ad f8 9f LDA $9ff8 ; (sstack + 2)
19f2 : 85 12 __ STA P5 
19f4 : a9 09 __ LDA #$09
19f6 : 85 10 __ STA P3 
19f8 : a9 06 __ LDA #$06
19fa : 85 11 __ STA P4 
19fc : 20 ba 18 JSR $18ba ; (openBufferChannel.s4 + 0)
19ff : 24 1c __ BIT ACCU + 1 ; (track + 0)
1a01 : 30 24 __ BMI $1a27 ; (writeSector.s8 + 0)
.s5:
1a03 : 20 32 1a JSR $1a32 ; (writeMemToBuffer.s4 + 0)
1a06 : 24 1c __ BIT ACCU + 1 ; (track + 0)
1a08 : 30 1d __ BMI $1a27 ; (writeSector.s8 + 0)
.s6:
1a0a : ad f9 9f LDA $9ff9 ; (sstack + 3)
1a0d : 85 17 __ STA P10 
1a0f : ad fa 9f LDA $9ffa ; (sstack + 4)
1a12 : 85 18 __ STA P11 
1a14 : ad fb 9f LDA $9ffb ; (sstack + 5)
1a17 : 8d f6 9f STA $9ff6 ; (sstack + 0)
1a1a : ad fc 9f LDA $9ffc ; (sstack + 6)
1a1d : 8d f7 9f STA $9ff7 ; (sstack + 1)
1a20 : 20 7c 1a JSR $1a7c ; (saveBufferToSector.s4 + 0)
1a23 : 24 1c __ BIT ACCU + 1 ; (track + 0)
1a25 : 10 04 __ BPL $1a2b ; (writeSector.s7 + 0)
.s8:
1a27 : a9 ff __ LDA #$ff
1a29 : d0 02 __ BNE $1a2d ; (writeSector.s3 + 0)
.s7:
1a2b : a9 00 __ LDA #$00
.s3:
1a2d : 85 1b __ STA ACCU + 0 ; (driveid + 0)
1a2f : 85 1c __ STA ACCU + 1 ; (track + 0)
1a31 : 60 __ __ RTS
--------------------------------------------------------------------
writeMemToBuffer: ; writeMemToBuffer()->i16
.s4:
1a32 : a9 10 __ LDA #$10
1a34 : 85 0e __ STA P1 
1a36 : a9 1a __ LDA #$1a
1a38 : 85 10 __ STA P3 
1a3a : a9 74 __ LDA #$74
1a3c : 85 0f __ STA P2 
1a3e : 20 de 0f JSR $0fde ; (krnio_puts.s4 + 0)
1a41 : a5 1c __ LDA ACCU + 1 
1a43 : 30 1f __ BMI $1a64 ; (writeMemToBuffer.s7 + 0)
.s8:
1a45 : 05 1b __ ORA ACCU + 0 
1a47 : f0 1b __ BEQ $1a64 ; (writeMemToBuffer.s7 + 0)
.s5:
1a49 : a9 09 __ LDA #$09
1a4b : 85 0e __ STA P1 
1a4d : a9 1d __ LDA #$1d
1a4f : 85 10 __ STA P3 
1a51 : a9 00 __ LDA #$00
1a53 : 85 11 __ STA P4 
1a55 : a9 01 __ LDA #$01
1a57 : 85 12 __ STA P5 
1a59 : a9 00 __ LDA #$00
1a5b : 85 0f __ STA P2 
1a5d : 20 62 17 JSR $1762 ; (krnio_write.s4 + 0)
1a60 : 24 1c __ BIT ACCU + 1 
1a62 : 10 09 __ BPL $1a6d ; (writeMemToBuffer.s6 + 0)
.s7:
1a64 : a9 09 __ LDA #$09
1a66 : 20 4b 10 JSR $104b ; (krnio_close.s4 + 0)
1a69 : a9 ff __ LDA #$ff
1a6b : d0 02 __ BNE $1a6f ; (writeMemToBuffer.s3 + 0)
.s6:
1a6d : a9 00 __ LDA #$00
.s3:
1a6f : 85 1b __ STA ACCU + 0 
1a71 : 85 1c __ STA ACCU + 1 
1a73 : 60 __ __ RTS
--------------------------------------------------------------------
1a74 : __ __ __ BYT 42 2d 50 20 36 20 30 00                         : B-P 6 0.
--------------------------------------------------------------------
saveBufferToSector: ; saveBufferToSector(u8,u8,struct sstr*)->i16
.s4:
1a7c : a9 c8 __ LDA #$c8
1a7e : 85 0d __ STA P0 
1a80 : a9 1a __ LDA #$1a
1a82 : 85 10 __ STA P3 
1a84 : a9 9f __ LDA #$9f
1a86 : 85 0e __ STA P1 
1a88 : a9 f4 __ LDA #$f4
1a8a : 85 0f __ STA P2 
1a8c : 20 ab 0d JSR $0dab ; (set_sstr.s4 + 0)
1a8f : a5 17 __ LDA P10 ; (track + 0)
1a91 : 85 15 __ STA P8 
1a93 : a9 c8 __ LDA #$c8
1a95 : 85 13 __ STA P6 
1a97 : a9 9f __ LDA #$9f
1a99 : 85 14 __ STA P7 
1a9b : a9 00 __ LDA #$00
1a9d : 85 16 __ STA P9 
1a9f : 20 ce 0d JSR $0dce ; (append_sstr_num.s4 + 0)
1aa2 : a9 c8 __ LDA #$c8
1aa4 : 85 0d __ STA P0 
1aa6 : a9 19 __ LDA #$19
1aa8 : 85 10 __ STA P3 
1aaa : a9 9f __ LDA #$9f
1aac : 85 0e __ STA P1 
1aae : a9 57 __ LDA #$57
1ab0 : 85 0f __ STA P2 
1ab2 : 20 9d 0e JSR $0e9d ; (append_sstr.s4 + 0)
1ab5 : a5 18 __ LDA P11 ; (sec + 0)
1ab7 : 85 15 __ STA P8 
1ab9 : 20 ce 0d JSR $0dce ; (append_sstr_num.s4 + 0)
1abc : a9 10 __ LDA #$10
1abe : 85 0e __ STA P1 
1ac0 : a9 9f __ LDA #$9f
1ac2 : 85 10 __ STA P3 
1ac4 : a9 c9 __ LDA #$c9
1ac6 : 85 0f __ STA P2 
1ac8 : 20 de 0f JSR $0fde ; (krnio_puts.s4 + 0)
1acb : a5 1b __ LDA ACCU + 0 
1acd : 85 49 __ STA T0 + 0 
1acf : a5 1c __ LDA ACCU + 1 
1ad1 : 85 4a __ STA T0 + 1 
1ad3 : a9 09 __ LDA #$09
1ad5 : 20 4b 10 JSR $104b ; (krnio_close.s4 + 0)
1ad8 : a5 4a __ LDA T0 + 1 
1ada : 30 11 __ BMI $1aed ; (saveBufferToSector.s6 + 0)
.s7:
1adc : 05 49 __ ORA T0 + 0 
1ade : f0 0d __ BEQ $1aed ; (saveBufferToSector.s6 + 0)
.s5:
1ae0 : ad f6 9f LDA $9ff6 ; (sstack + 0)
1ae3 : 85 13 __ STA P6 
1ae5 : ad f7 9f LDA $9ff7 ; (sstack + 1)
1ae8 : 85 14 __ STA P7 
1aea : 4c fc 1a JMP $1afc ; (waitForWriteStatus.s4 + 0)
.s6:
1aed : a9 ff __ LDA #$ff
1aef : 85 1b __ STA ACCU + 0 
1af1 : 85 1c __ STA ACCU + 1 
.s3:
1af3 : 60 __ __ RTS
--------------------------------------------------------------------
1af4 : __ __ __ BYT 55 32 20 36 20 30 20 00                         : U2 6 0 .
--------------------------------------------------------------------
waitForWriteStatus: ; waitForWriteStatus(struct sstr*)->i16
.s4:
1afc : a9 10 __ LDA #$10
1afe : 85 0e __ STA P1 
1b00 : 85 11 __ STA P4 
1b02 : a9 00 __ LDA #$00
1b04 : 85 12 __ STA P5 
1b06 : 18 __ __ CLC
1b07 : a5 13 __ LDA P6 ; (status_str + 0)
1b09 : 69 01 __ ADC #$01
1b0b : 85 0f __ STA P2 
1b0d : a5 14 __ LDA P7 ; (status_str + 1)
1b0f : 69 00 __ ADC #$00
1b11 : 85 10 __ STA P3 
1b13 : 20 53 10 JSR $1053 ; (krnio_read.s4 + 0)
1b16 : a9 00 __ LDA #$00
1b18 : a0 10 __ LDY #$10
1b1a : 91 13 __ STA (P6),y ; (status_str + 0)
1b1c : a5 0f __ LDA P2 
1b1e : 85 0d __ STA P0 
1b20 : a5 10 __ LDA P3 
1b22 : 85 0e __ STA P1 
1b24 : 20 f2 10 JSR $10f2 ; (atoi.l4 + 0)
1b27 : a5 1b __ LDA ACCU + 0 
1b29 : 85 47 __ STA T0 + 0 
1b2b : a5 1c __ LDA ACCU + 1 
1b2d : 85 48 __ STA T0 + 1 
1b2f : a9 09 __ LDA #$09
1b31 : 20 4b 10 JSR $104b ; (krnio_close.s4 + 0)
1b34 : a5 48 __ LDA T0 + 1 
1b36 : 30 08 __ BMI $1b40 ; (waitForWriteStatus.s5 + 0)
.s8:
1b38 : d0 0a __ BNE $1b44 ; (waitForWriteStatus.s6 + 0)
.s7:
1b3a : a5 47 __ LDA T0 + 0 
1b3c : c9 14 __ CMP #$14
1b3e : b0 04 __ BCS $1b44 ; (waitForWriteStatus.s6 + 0)
.s5:
1b40 : a9 00 __ LDA #$00
1b42 : f0 02 __ BEQ $1b46 ; (waitForWriteStatus.s3 + 0)
.s6:
1b44 : a9 ff __ LDA #$ff
.s3:
1b46 : 85 1b __ STA ACCU + 0 
1b48 : 85 1c __ STA ACCU + 1 
1b4a : 60 __ __ RTS
--------------------------------------------------------------------
1b4b : __ __ __ BYT 2e 00                                           : ..
--------------------------------------------------------------------
setNormalXY: ; setNormalXY(u8,u8)->void
.s4:
1b4d : a5 0e __ LDA P1 ; (y + 0)
1b4f : 0a __ __ ASL
1b50 : 85 1b __ STA ACCU + 0 
1b52 : a9 00 __ LDA #$00
1b54 : 2a __ __ ROL
1b55 : 06 1b __ ASL ACCU + 0 
1b57 : 2a __ __ ROL
1b58 : aa __ __ TAX
1b59 : a5 1b __ LDA ACCU + 0 
1b5b : 65 0e __ ADC P1 ; (y + 0)
1b5d : 85 1b __ STA ACCU + 0 
1b5f : 8a __ __ TXA
1b60 : 69 00 __ ADC #$00
1b62 : 06 1b __ ASL ACCU + 0 
1b64 : 2a __ __ ROL
1b65 : 06 1b __ ASL ACCU + 0 
1b67 : 2a __ __ ROL
1b68 : 06 1b __ ASL ACCU + 0 
1b6a : 2a __ __ ROL
1b6b : 69 d8 __ ADC #$d8
1b6d : 85 1c __ STA ACCU + 1 
1b6f : a9 0f __ LDA #$0f
1b71 : a4 0d __ LDY P0 ; (x + 0)
1b73 : 91 1b __ STA (ACCU + 0),y 
.s3:
1b75 : 60 __ __ RTS
--------------------------------------------------------------------
1b76 : __ __ __ BYT 4a 4f 42 20 43 4f 4d 50 4c 45 54 45 44 21 20 50 : JOB COMPLETED! P
1b86 : __ __ __ BYT 52 45 53 53 20 c3 20 4f 52 20 d1 20 20 20 00    : RESS . OR .   .
--------------------------------------------------------------------
1b95 : __ __ __ BYT 43 4f 50 59 20 45 52 52 4f 52 21 20 50 52 45 53 : COPY ERROR! PRES
1ba5 : __ __ __ BYT 53 20 c3 20 4f 52 20 d1 20 20 20 20 20 20 00    : S . OR .      .
--------------------------------------------------------------------
divmod: ; divmod
1bb4 : a5 1c __ LDA ACCU + 1 
1bb6 : d0 31 __ BNE $1be9 ; (divmod + 53)
1bb8 : a5 04 __ LDA WORK + 1 
1bba : d0 1e __ BNE $1bda ; (divmod + 38)
1bbc : 85 06 __ STA WORK + 3 
1bbe : a2 04 __ LDX #$04
1bc0 : 06 1b __ ASL ACCU + 0 
1bc2 : 2a __ __ ROL
1bc3 : c5 03 __ CMP WORK + 0 
1bc5 : 90 02 __ BCC $1bc9 ; (divmod + 21)
1bc7 : e5 03 __ SBC WORK + 0 
1bc9 : 26 1b __ ROL ACCU + 0 
1bcb : 2a __ __ ROL
1bcc : c5 03 __ CMP WORK + 0 
1bce : 90 02 __ BCC $1bd2 ; (divmod + 30)
1bd0 : e5 03 __ SBC WORK + 0 
1bd2 : 26 1b __ ROL ACCU + 0 
1bd4 : ca __ __ DEX
1bd5 : d0 eb __ BNE $1bc2 ; (divmod + 14)
1bd7 : 85 05 __ STA WORK + 2 
1bd9 : 60 __ __ RTS
1bda : a5 1b __ LDA ACCU + 0 
1bdc : 85 05 __ STA WORK + 2 
1bde : a5 1c __ LDA ACCU + 1 
1be0 : 85 06 __ STA WORK + 3 
1be2 : a9 00 __ LDA #$00
1be4 : 85 1b __ STA ACCU + 0 
1be6 : 85 1c __ STA ACCU + 1 
1be8 : 60 __ __ RTS
1be9 : a5 04 __ LDA WORK + 1 
1beb : d0 1f __ BNE $1c0c ; (divmod + 88)
1bed : a5 03 __ LDA WORK + 0 
1bef : 30 1b __ BMI $1c0c ; (divmod + 88)
1bf1 : a9 00 __ LDA #$00
1bf3 : 85 06 __ STA WORK + 3 
1bf5 : a2 10 __ LDX #$10
1bf7 : 06 1b __ ASL ACCU + 0 
1bf9 : 26 1c __ ROL ACCU + 1 
1bfb : 2a __ __ ROL
1bfc : c5 03 __ CMP WORK + 0 
1bfe : 90 02 __ BCC $1c02 ; (divmod + 78)
1c00 : e5 03 __ SBC WORK + 0 
1c02 : 26 1b __ ROL ACCU + 0 
1c04 : 26 1c __ ROL ACCU + 1 
1c06 : ca __ __ DEX
1c07 : d0 f2 __ BNE $1bfb ; (divmod + 71)
1c09 : 85 05 __ STA WORK + 2 
1c0b : 60 __ __ RTS
1c0c : a9 00 __ LDA #$00
1c0e : 85 05 __ STA WORK + 2 
1c10 : 85 06 __ STA WORK + 3 
1c12 : 84 02 __ STY $02 
1c14 : a0 10 __ LDY #$10
1c16 : 18 __ __ CLC
1c17 : 26 1b __ ROL ACCU + 0 
1c19 : 26 1c __ ROL ACCU + 1 
1c1b : 26 05 __ ROL WORK + 2 
1c1d : 26 06 __ ROL WORK + 3 
1c1f : 38 __ __ SEC
1c20 : a5 05 __ LDA WORK + 2 
1c22 : e5 03 __ SBC WORK + 0 
1c24 : aa __ __ TAX
1c25 : a5 06 __ LDA WORK + 3 
1c27 : e5 04 __ SBC WORK + 1 
1c29 : 90 04 __ BCC $1c2f ; (divmod + 123)
1c2b : 86 05 __ STX WORK + 2 
1c2d : 85 06 __ STA WORK + 3 
1c2f : 88 __ __ DEY
1c30 : d0 e5 __ BNE $1c17 ; (divmod + 99)
1c32 : 26 1b __ ROL ACCU + 0 
1c34 : 26 1c __ ROL ACCU + 1 
1c36 : a4 02 __ LDY $02 
1c38 : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
1c39 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
giocharmap:
1c3a : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
r1:
1c3b : __ __ __ BYT 70 40 40 40 40 40 40 40 40 40 40 40 40 6e 00    : p@@@@@@@@@@@@n.
--------------------------------------------------------------------
r2:
1c4a : __ __ __ BYT 5d 20 20 20 20 20 20 20 20 20 20 20 20 5d 00    : ]            ].
--------------------------------------------------------------------
r3:
1c59 : __ __ __ BYT 5d 20 6f 6f 6f 62 62 62 6f 6f 6f 20 20 5d 00    : ] ooobbbooo  ].
--------------------------------------------------------------------
r4:
1c68 : __ __ __ BYT 5d 20 20 20 20 78 78 78 20 20 20 20 20 5d 00    : ]    xxx     ].
--------------------------------------------------------------------
r5:
1c77 : __ __ __ BYT 5d 20 2e 20 20 20 20 20 20 20 20 20 20 5d 00    : ] .          ].
--------------------------------------------------------------------
r6:
1c86 : __ __ __ BYT 6d 40 40 40 40 40 40 40 40 40 40 40 40 7d 00    : m@@@@@@@@@@@@}.
--------------------------------------------------------------------
CIA1_TODH:
1c95 : __ __ __ BYT 0b dc                                           : ..
--------------------------------------------------------------------
CIA1_TODM:
1c97 : __ __ __ BYT 0a dc                                           : ..
--------------------------------------------------------------------
CIA1_TODS:
1c99 : __ __ __ BYT 09 dc                                           : ..
--------------------------------------------------------------------
CIA1_TODT:
1c9b : __ __ __ BYT 08 dc                                           : ..
--------------------------------------------------------------------
1c9d : __ __ __ BYT 00 00 2e 00 00 00                               : ......
--------------------------------------------------------------------
sectors:
1ca3 : __ __ __ BSS	35
--------------------------------------------------------------------
keyb_key:
1cc6 : __ __ __ BSS	1
--------------------------------------------------------------------
keyb_matrix:
1cc7 : __ __ __ BSS	8
--------------------------------------------------------------------
ciaa_pra_def:
1ccf : __ __ __ BSS	1
--------------------------------------------------------------------
krnio_pstatus:
1cd0 : __ __ __ BSS	16
--------------------------------------------------------------------
buffer:
1d00 : __ __ __ BSS	256

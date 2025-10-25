; Compiled with 1.32.263
--------------------------------------------------------------------
startup: ; startup
1c01 : 0b __ __ INV
1c02 : 08 __ __ PHP
1c03 : 0a __ __ ASL
1c04 : 00 __ __ BRK
1c05 : 9e __ __ INV
1c06 : 37 __ __ INV
1c07 : 31 38 __ AND ($38),y 
1c09 : 31 00 __ AND ($00),y 
1c0b : 00 __ __ BRK
1c0c : 00 __ __ BRK
1c0d : a9 0e __ LDA #$0e
1c0f : 8d 00 ff STA $ff00 
1c12 : ba __ __ TSX
1c13 : 8e fe 2e STX $2efe ; (spentry + 0)
1c16 : a2 30 __ LDX #$30
1c18 : a0 ab __ LDY #$ab
1c1a : a9 00 __ LDA #$00
1c1c : 85 19 __ STA IP + 0 
1c1e : 86 1a __ STX IP + 1 
1c20 : e0 32 __ CPX #$32
1c22 : f0 0b __ BEQ $1c2f ; (startup + 46)
1c24 : 91 19 __ STA (IP + 0),y 
1c26 : c8 __ __ INY
1c27 : d0 fb __ BNE $1c24 ; (startup + 35)
1c29 : e8 __ __ INX
1c2a : d0 f2 __ BNE $1c1e ; (startup + 29)
1c2c : 91 19 __ STA (IP + 0),y 
1c2e : c8 __ __ INY
1c2f : c0 00 __ CPY #$00
1c31 : d0 f9 __ BNE $1c2c ; (startup + 43)
1c33 : a9 00 __ LDA #$00
1c35 : a2 f7 __ LDX #$f7
1c37 : d0 03 __ BNE $1c3c ; (startup + 59)
1c39 : 95 00 __ STA $00,x 
1c3b : e8 __ __ INX
1c3c : e0 f7 __ CPX #$f7
1c3e : d0 f9 __ BNE $1c39 ; (startup + 56)
1c40 : a9 50 __ LDA #$50
1c42 : 85 23 __ STA SP + 0 
1c44 : a9 bf __ LDA #$bf
1c46 : 85 24 __ STA SP + 1 
1c48 : 20 80 1c JSR $1c80 ; (main.s1 + 0)
1c4b : a9 4c __ LDA #$4c
1c4d : 85 54 __ STA $54 
1c4f : a9 00 __ LDA #$00
1c51 : 85 13 __ STA P6 
1c53 : 85 1a __ STA IP + 1 
1c55 : a9 1b __ LDA #$1b
1c57 : 85 18 __ STA P11 
1c59 : a9 19 __ LDA #$19
1c5b : 85 16 __ STA P9 
1c5d : 60 __ __ RTS
--------------------------------------------------------------------
main: ; main()->i16
.s1:
1c80 : a5 53 __ LDA T3 + 0 
1c82 : 8d 52 bf STA $bf52 ; (main@stack + 0)
1c85 : a5 54 __ LDA T4 + 0 
1c87 : 8d 53 bf STA $bf53 ; (main@stack + 1)
1c8a : a5 55 __ LDA T5 + 0 
1c8c : 8d 54 bf STA $bf54 ; (main@stack + 2)
.s4:
1c8f : 20 3f 1f JSR $1f3f ; (fillSectorsInfo.s4 + 0)
1c92 : a9 08 __ LDA #$08
1c94 : 85 53 __ STA T3 + 0 
1c96 : a9 09 __ LDA #$09
1c98 : 85 54 __ STA T4 + 0 
.l5:
1c9a : a9 93 __ LDA #$93
1c9c : 20 68 1f JSR $1f68 ; (putpch.s4 + 0)
1c9f : a9 0e __ LDA #$0e
1ca1 : 20 68 1f JSR $1f68 ; (putpch.s4 + 0)
1ca4 : 20 cb 1f JSR $1fcb ; (setDarkTheme.s4 + 0)
1ca7 : a9 0a __ LDA #$0a
1ca9 : 85 0d __ STA P0 
1cab : a9 20 __ LDA #$20
1cad : 85 10 __ STA P3 
1caf : a9 05 __ LDA #$05
1cb1 : 85 0e __ STA P1 
1cb3 : a9 77 __ LDA #$77
1cb5 : 85 0f __ STA P2 
1cb7 : 20 31 20 JSR $2031 ; (putsxy.s4 + 0)
1cba : a9 17 __ LDA #$17
1cbc : 85 0e __ STA P1 
1cbe : a9 20 __ LDA #$20
1cc0 : 85 10 __ STA P3 
1cc2 : a9 89 __ LDA #$89
1cc4 : 85 0f __ STA P2 
1cc6 : 20 31 20 JSR $2031 ; (putsxy.s4 + 0)
1cc9 : a9 08 __ LDA #$08
1ccb : 85 11 __ STA P4 
1ccd : a9 07 __ LDA #$07
1ccf : 85 12 __ STA P5 
1cd1 : 20 9b 20 JSR $209b ; (keyb_poll.s4 + 0)
1cd4 : 20 4c 21 JSR $214c ; (drawBox.s4 + 0)
1cd7 : a9 0d __ LDA #$0d
1cd9 : 85 12 __ STA P5 
1cdb : 20 4c 21 JSR $214c ; (drawBox.s4 + 0)
1cde : a9 57 __ LDA #$57
1ce0 : 85 0d __ STA P0 
1ce2 : a9 21 __ LDA #$21
1ce4 : 85 10 __ STA P3 
1ce6 : a9 bf __ LDA #$bf
1ce8 : 85 0e __ STA P1 
1cea : a9 c2 __ LDA #$c2
1cec : 85 0f __ STA P2 
1cee : 20 a3 21 JSR $21a3 ; (set_sstr.s4 + 0)
1cf1 : a5 53 __ LDA T3 + 0 
1cf3 : 85 15 __ STA P8 
1cf5 : a9 57 __ LDA #$57
1cf7 : 85 13 __ STA P6 
1cf9 : a9 bf __ LDA #$bf
1cfb : 85 14 __ STA P7 
1cfd : a9 00 __ LDA #$00
1cff : 85 55 __ STA T5 + 0 
1d01 : 85 16 __ STA P9 
1d03 : 20 c6 21 JSR $21c6 ; (append_sstr_num.s4 + 0)
1d06 : a9 10 __ LDA #$10
1d08 : 85 0d __ STA P0 
1d0a : a9 bf __ LDA #$bf
1d0c : 85 10 __ STA P3 
1d0e : a9 0b __ LDA #$0b
1d10 : 85 0e __ STA P1 
1d12 : a9 58 __ LDA #$58
1d14 : 85 0f __ STA P2 
1d16 : 20 31 20 JSR $2031 ; (putsxy.s4 + 0)
1d19 : a9 57 __ LDA #$57
1d1b : 85 0d __ STA P0 
1d1d : a9 22 __ LDA #$22
1d1f : 85 10 __ STA P3 
1d21 : a9 bf __ LDA #$bf
1d23 : 85 0e __ STA P1 
1d25 : a9 c2 __ LDA #$c2
1d27 : 85 0f __ STA P2 
1d29 : 20 a3 21 JSR $21a3 ; (set_sstr.s4 + 0)
1d2c : a5 54 __ LDA T4 + 0 
1d2e : 85 15 __ STA P8 
1d30 : 20 c6 21 JSR $21c6 ; (append_sstr_num.s4 + 0)
1d33 : a9 10 __ LDA #$10
1d35 : 85 0d __ STA P0 
1d37 : a9 bf __ LDA #$bf
1d39 : 85 10 __ STA P3 
1d3b : a9 11 __ LDA #$11
1d3d : 85 0e __ STA P1 
1d3f : a9 58 __ LDA #$58
1d41 : 85 0f __ STA P2 
1d43 : 20 31 20 JSR $2031 ; (putsxy.s4 + 0)
1d46 : a9 0c __ LDA #$0c
1d48 : 85 0d __ STA P0 
1d4a : a9 22 __ LDA #$22
1d4c : 85 10 __ STA P3 
1d4e : a9 14 __ LDA #$14
1d50 : 85 0e __ STA P1 
1d52 : a9 c7 __ LDA #$c7
1d54 : 85 0f __ STA P2 
1d56 : 20 31 20 JSR $2031 ; (putsxy.s4 + 0)
.l6:
1d59 : 20 d3 22 JSR $22d3 ; (getch.l4 + 0)
1d5c : c9 59 __ CMP #$59
1d5e : d0 71 __ BNE $1dd1 ; (main.s7 + 0)
.s29:
1d60 : a9 57 __ LDA #$57
1d62 : 85 0d __ STA P0 
1d64 : a9 21 __ LDA #$21
1d66 : 85 10 __ STA P3 
1d68 : a9 bf __ LDA #$bf
1d6a : 85 0e __ STA P1 
1d6c : a9 c2 __ LDA #$c2
1d6e : 85 0f __ STA P2 
1d70 : 20 a3 21 JSR $21a3 ; (set_sstr.s4 + 0)
1d73 : a5 54 __ LDA T4 + 0 
1d75 : 85 15 __ STA P8 
1d77 : a9 57 __ LDA #$57
1d79 : 85 13 __ STA P6 
1d7b : a9 bf __ LDA #$bf
1d7d : 85 14 __ STA P7 
1d7f : a9 00 __ LDA #$00
1d81 : 85 16 __ STA P9 
1d83 : 20 c6 21 JSR $21c6 ; (append_sstr_num.s4 + 0)
1d86 : a9 10 __ LDA #$10
1d88 : 85 0d __ STA P0 
1d8a : a9 bf __ LDA #$bf
1d8c : 85 10 __ STA P3 
1d8e : a9 0b __ LDA #$0b
1d90 : 85 0e __ STA P1 
1d92 : a9 58 __ LDA #$58
1d94 : 85 0f __ STA P2 
1d96 : 20 31 20 JSR $2031 ; (putsxy.s4 + 0)
1d99 : a9 57 __ LDA #$57
1d9b : 85 0d __ STA P0 
1d9d : a9 22 __ LDA #$22
1d9f : 85 10 __ STA P3 
1da1 : a9 bf __ LDA #$bf
1da3 : 85 0e __ STA P1 
1da5 : a9 c2 __ LDA #$c2
1da7 : 85 0f __ STA P2 
1da9 : 20 a3 21 JSR $21a3 ; (set_sstr.s4 + 0)
1dac : a5 53 __ LDA T3 + 0 
1dae : 85 15 __ STA P8 
1db0 : 20 c6 21 JSR $21c6 ; (append_sstr_num.s4 + 0)
1db3 : a9 10 __ LDA #$10
1db5 : 85 0d __ STA P0 
1db7 : a9 bf __ LDA #$bf
1db9 : 85 10 __ STA P3 
1dbb : a9 11 __ LDA #$11
1dbd : 85 0e __ STA P1 
1dbf : a9 58 __ LDA #$58
1dc1 : 85 0f __ STA P2 
1dc3 : 20 31 20 JSR $2031 ; (putsxy.s4 + 0)
1dc6 : a5 54 __ LDA T4 + 0 
1dc8 : 85 53 __ STA T3 + 0 
1dca : a5 15 __ LDA P8 
1dcc : 85 54 __ STA T4 + 0 
1dce : 4c 59 1d JMP $1d59 ; (main.l6 + 0)
.s7:
1dd1 : c9 4e __ CMP #$4e
1dd3 : f0 1d __ BEQ $1df2 ; (main.s10 + 0)
.s8:
1dd5 : c9 51 __ CMP #$51
1dd7 : d0 80 __ BNE $1d59 ; (main.l6 + 0)
.s9:
1dd9 : 20 11 23 JSR $2311 ; (resetCPU.s4 + 0)
1ddc : a9 00 __ LDA #$00
1dde : 85 1b __ STA ACCU + 0 
1de0 : 85 1c __ STA ACCU + 1 
.s3:
1de2 : ad 52 bf LDA $bf52 ; (main@stack + 0)
1de5 : 85 53 __ STA T3 + 0 
1de7 : ad 53 bf LDA $bf53 ; (main@stack + 1)
1dea : 85 54 __ STA T4 + 0 
1dec : ad 54 bf LDA $bf54 ; (main@stack + 2)
1def : 85 55 __ STA T5 + 0 
1df1 : 60 __ __ RTS
.s10:
1df2 : a5 53 __ LDA T3 + 0 
1df4 : 85 13 __ STA P6 
1df6 : 20 15 23 JSR $2315 ; (getDriveInfo.s4 + 0)
1df9 : a5 1c __ LDA ACCU + 1 
1dfb : 30 06 __ BMI $1e03 ; (main.s11 + 0)
.s28:
1dfd : 85 52 __ STA T1 + 1 
1dff : 05 1b __ ORA ACCU + 0 
1e01 : d0 07 __ BNE $1e0a ; (main.s27 + 0)
.s11:
1e03 : a9 25 __ LDA #$25
1e05 : a0 94 __ LDY #$94
1e07 : 4c 38 1e JMP $1e38 ; (main.s12 + 0)
.s27:
1e0a : a5 1b __ LDA ACCU + 0 
1e0c : 85 51 __ STA T1 + 0 
1e0e : a9 57 __ LDA #$57
1e10 : 85 0d __ STA P0 
1e12 : a9 23 __ LDA #$23
1e14 : 85 10 __ STA P3 
1e16 : a9 bf __ LDA #$bf
1e18 : 85 0e __ STA P1 
1e1a : a9 a7 __ LDA #$a7
1e1c : 85 0f __ STA P2 
1e1e : 20 a3 21 JSR $21a3 ; (set_sstr.s4 + 0)
1e21 : a5 51 __ LDA T1 + 0 
1e23 : 85 15 __ STA P8 
1e25 : a9 57 __ LDA #$57
1e27 : 85 13 __ STA P6 
1e29 : a9 bf __ LDA #$bf
1e2b : 85 14 __ STA P7 
1e2d : a5 52 __ LDA T1 + 1 
1e2f : 85 16 __ STA P9 
1e31 : 20 c6 21 JSR $21c6 ; (append_sstr_num.s4 + 0)
1e34 : a9 bf __ LDA #$bf
1e36 : a0 58 __ LDY #$58
.s12:
1e38 : 84 0f __ STY P2 
1e3a : 85 10 __ STA P3 
1e3c : a9 10 __ LDA #$10
1e3e : 85 0d __ STA P0 
1e40 : a9 07 __ LDA #$07
1e42 : 85 0e __ STA P1 
1e44 : 20 31 20 JSR $2031 ; (putsxy.s4 + 0)
1e47 : a5 54 __ LDA T4 + 0 
1e49 : 85 13 __ STA P6 
1e4b : 20 15 23 JSR $2315 ; (getDriveInfo.s4 + 0)
1e4e : a5 1c __ LDA ACCU + 1 
1e50 : 30 06 __ BMI $1e58 ; (main.s13 + 0)
.s26:
1e52 : 85 52 __ STA T1 + 1 
1e54 : 05 1b __ ORA ACCU + 0 
1e56 : d0 07 __ BNE $1e5f ; (main.s25 + 0)
.s13:
1e58 : a9 25 __ LDA #$25
1e5a : a0 94 __ LDY #$94
1e5c : 4c 8d 1e JMP $1e8d ; (main.s14 + 0)
.s25:
1e5f : a5 1b __ LDA ACCU + 0 
1e61 : 85 51 __ STA T1 + 0 
1e63 : a9 57 __ LDA #$57
1e65 : 85 0d __ STA P0 
1e67 : a9 23 __ LDA #$23
1e69 : 85 10 __ STA P3 
1e6b : a9 bf __ LDA #$bf
1e6d : 85 0e __ STA P1 
1e6f : a9 a7 __ LDA #$a7
1e71 : 85 0f __ STA P2 
1e73 : 20 a3 21 JSR $21a3 ; (set_sstr.s4 + 0)
1e76 : a5 51 __ LDA T1 + 0 
1e78 : 85 15 __ STA P8 
1e7a : a9 57 __ LDA #$57
1e7c : 85 13 __ STA P6 
1e7e : a9 bf __ LDA #$bf
1e80 : 85 14 __ STA P7 
1e82 : a5 52 __ LDA T1 + 1 
1e84 : 85 16 __ STA P9 
1e86 : 20 c6 21 JSR $21c6 ; (append_sstr_num.s4 + 0)
1e89 : a9 bf __ LDA #$bf
1e8b : a0 58 __ LDY #$58
.s14:
1e8d : 84 0f __ STY P2 
1e8f : 85 10 __ STA P3 
1e91 : a9 10 __ LDA #$10
1e93 : 85 0d __ STA P0 
1e95 : a9 0d __ LDA #$0d
1e97 : 85 0e __ STA P1 
1e99 : 20 31 20 JSR $2031 ; (putsxy.s4 + 0)
1e9c : a9 0a __ LDA #$0a
1e9e : 85 0d __ STA P0 
1ea0 : a9 25 __ LDA #$25
1ea2 : 85 10 __ STA P3 
1ea4 : a9 14 __ LDA #$14
1ea6 : 85 0e __ STA P1 
1ea8 : a9 96 __ LDA #$96
1eaa : 85 0f __ STA P2 
1eac : 20 31 20 JSR $2031 ; (putsxy.s4 + 0)
1eaf : e6 0e __ INC P1 
1eb1 : a9 b0 __ LDA #$b0
1eb3 : 85 0f __ STA P2 
1eb5 : a9 25 __ LDA #$25
1eb7 : 85 10 __ STA P3 
1eb9 : 20 31 20 JSR $2031 ; (putsxy.s4 + 0)
1ebc : e6 0e __ INC P1 
1ebe : a9 cb __ LDA #$cb
1ec0 : 85 0f __ STA P2 
1ec2 : a9 25 __ LDA #$25
1ec4 : 85 10 __ STA P3 
1ec6 : 20 31 20 JSR $2031 ; (putsxy.s4 + 0)
.l15:
1ec9 : 20 d3 22 JSR $22d3 ; (getch.l4 + 0)
1ecc : c9 43 __ CMP #$43
1ece : f0 0d __ BEQ $1edd ; (main.s19 + 0)
.s16:
1ed0 : c9 4f __ CMP #$4f
1ed2 : f0 07 __ BEQ $1edb ; (main.s18 + 0)
.s17:
1ed4 : c9 51 __ CMP #$51
1ed6 : d0 f1 __ BNE $1ec9 ; (main.l15 + 0)
1ed8 : 4c d9 1d JMP $1dd9 ; (main.s9 + 0)
.s18:
1edb : e6 55 __ INC T5 + 0 
.s19:
1edd : a9 93 __ LDA #$93
1edf : 20 68 1f JSR $1f68 ; (putpch.s4 + 0)
1ee2 : 20 d8 25 JSR $25d8 ; (printTrackNumbers.s4 + 0)
1ee5 : 20 71 26 JSR $2671 ; (printSectorNumbers.s4 + 0)
1ee8 : 20 b7 26 JSR $26b7 ; (printLegend.s4 + 0)
1eeb : a9 0a __ LDA #$0a
1eed : 85 0d __ STA P0 
1eef : a9 27 __ LDA #$27
1ef1 : 85 10 __ STA P3 
1ef3 : a9 00 __ LDA #$00
1ef5 : 85 0e __ STA P1 
1ef7 : a9 1c __ LDA #$1c
1ef9 : 85 0f __ STA P2 
1efb : 20 31 20 JSR $2031 ; (putsxy.s4 + 0)
1efe : a5 53 __ LDA T3 + 0 
1f00 : 8d fd bf STA $bffd ; (sstack + 7)
1f03 : a5 54 __ LDA T4 + 0 
1f05 : 8d fe bf STA $bffe ; (sstack + 8)
1f08 : a5 55 __ LDA T5 + 0 
1f0a : 8d ff bf STA $bfff ; (sstack + 9)
1f0d : 20 35 27 JSR $2735 ; (copyDisk.s4 + 0)
1f10 : a9 0a __ LDA #$0a
1f12 : 85 0d __ STA P0 
1f14 : a9 00 __ LDA #$00
1f16 : 85 0e __ STA P1 
1f18 : 24 1c __ BIT ACCU + 1 
1f1a : 10 07 __ BPL $1f23 ; (main.s24 + 0)
.s20:
1f1c : a9 2f __ LDA #$2f
1f1e : a0 9f __ LDY #$9f
1f20 : 4c 27 1f JMP $1f27 ; (main.s21 + 0)
.s24:
1f23 : a9 2f __ LDA #$2f
1f25 : a0 80 __ LDY #$80
.s21:
1f27 : 84 0f __ STY P2 
1f29 : 85 10 __ STA P3 
1f2b : 20 31 20 JSR $2031 ; (putsxy.s4 + 0)
.l22:
1f2e : 20 d3 22 JSR $22d3 ; (getch.l4 + 0)
1f31 : c9 43 __ CMP #$43
1f33 : d0 03 __ BNE $1f38 ; (main.s23 + 0)
1f35 : 4c 9a 1c JMP $1c9a ; (main.l5 + 0)
.s23:
1f38 : c9 51 __ CMP #$51
1f3a : d0 f2 __ BNE $1f2e ; (main.l22 + 0)
1f3c : 4c d9 1d JMP $1dd9 ; (main.s9 + 0)
--------------------------------------------------------------------
fillSectorsInfo: ; fillSectorsInfo()->void
.s4:
1f3f : a9 15 __ LDA #$15
1f41 : a2 10 __ LDX #$10
.l8:
1f43 : 9d ab 30 STA $30ab,x ; (sectors + 0)
1f46 : ca __ __ DEX
1f47 : 10 fa __ BPL $1f43 ; (fillSectorsInfo.l8 + 0)
.s5:
1f49 : a9 13 __ LDA #$13
1f4b : a2 06 __ LDX #$06
.l9:
1f4d : 9d bc 30 STA $30bc,x ; (sectors + 17)
1f50 : ca __ __ DEX
1f51 : 10 fa __ BPL $1f4d ; (fillSectorsInfo.l9 + 0)
.s6:
1f53 : a9 12 __ LDA #$12
1f55 : a2 05 __ LDX #$05
.l10:
1f57 : 9d c3 30 STA $30c3,x ; (sectors + 24)
1f5a : ca __ __ DEX
1f5b : 10 fa __ BPL $1f57 ; (fillSectorsInfo.l10 + 0)
.s7:
1f5d : a9 11 __ LDA #$11
1f5f : a2 04 __ LDX #$04
.l11:
1f61 : 9d c9 30 STA $30c9,x ; (sectors + 30)
1f64 : ca __ __ DEX
1f65 : 10 fa __ BPL $1f61 ; (fillSectorsInfo.l11 + 0)
.s3:
1f67 : 60 __ __ RTS
--------------------------------------------------------------------
putpch: ; putpch(u8)->void
.s4:
1f68 : 85 0d __ STA P0 ; (c + 0)
1f6a : ad ff 2e LDA $2eff ; (giocharmap + 0)
1f6d : f0 32 __ BEQ $1fa1 ; (putpch.s5 + 0)
.s6:
1f6f : a5 0d __ LDA P0 ; (c + 0)
1f71 : c9 0a __ CMP #$0a
1f73 : d0 04 __ BNE $1f79 ; (putpch.s7 + 0)
.s18:
1f75 : a9 0d __ LDA #$0d
1f77 : d0 32 __ BNE $1fab ; (putpch.s15 + 0)
.s7:
1f79 : c9 09 __ CMP #$09
1f7b : f0 36 __ BEQ $1fb3 ; (putpch.s16 + 0)
.s8:
1f7d : ad ff 2e LDA $2eff ; (giocharmap + 0)
1f80 : c9 02 __ CMP #$02
1f82 : 90 1d __ BCC $1fa1 ; (putpch.s5 + 0)
.s9:
1f84 : a5 0d __ LDA P0 ; (c + 0)
1f86 : c9 41 __ CMP #$41
1f88 : 90 17 __ BCC $1fa1 ; (putpch.s5 + 0)
.s10:
1f8a : c9 7b __ CMP #$7b
1f8c : b0 13 __ BCS $1fa1 ; (putpch.s5 + 0)
.s11:
1f8e : c9 61 __ CMP #$61
1f90 : b0 04 __ BCS $1f96 ; (putpch.s13 + 0)
.s12:
1f92 : c9 5b __ CMP #$5b
1f94 : b0 0b __ BCS $1fa1 ; (putpch.s5 + 0)
.s13:
1f96 : 49 20 __ EOR #$20
1f98 : 85 0d __ STA P0 ; (c + 0)
1f9a : ad ff 2e LDA $2eff ; (giocharmap + 0)
1f9d : c9 02 __ CMP #$02
1f9f : f0 06 __ BEQ $1fa7 ; (putpch.s14 + 0)
.s5:
1fa1 : a5 0d __ LDA P0 ; (c + 0)
1fa3 : 20 d2 ff JSR $ffd2 
.s3:
1fa6 : 60 __ __ RTS
.s14:
1fa7 : a5 0d __ LDA P0 ; (c + 0)
1fa9 : 29 5f __ AND #$5f
.s15:
1fab : 85 43 __ STA T0 + 0 
1fad : a5 43 __ LDA T0 + 0 
1faf : 20 d2 ff JSR $ffd2 
1fb2 : 60 __ __ RTS
.s16:
1fb3 : a5 ec __ LDA $ec 
1fb5 : 29 03 __ AND #$03
1fb7 : 85 43 __ STA T0 + 0 
1fb9 : a9 20 __ LDA #$20
1fbb : 85 44 __ STA T1 + 0 
.l17:
1fbd : a5 44 __ LDA T1 + 0 
1fbf : 20 d2 ff JSR $ffd2 
1fc2 : e6 43 __ INC T0 + 0 
1fc4 : a5 43 __ LDA T0 + 0 
1fc6 : c9 04 __ CMP #$04
1fc8 : 90 f3 __ BCC $1fbd ; (putpch.l17 + 0)
1fca : 60 __ __ RTS
--------------------------------------------------------------------
setDarkTheme: ; setDarkTheme()->void
.s4:
1fcb : a9 00 __ LDA #$00
1fcd : 85 1b __ STA ACCU + 0 
1fcf : a9 d8 __ LDA #$d8
1fd1 : 85 1c __ STA ACCU + 1 
.l5:
1fd3 : a9 0f __ LDA #$0f
1fd5 : a0 00 __ LDY #$00
1fd7 : 91 1b __ STA (ACCU + 0),y 
1fd9 : e6 1b __ INC ACCU + 0 
1fdb : d0 02 __ BNE $1fdf ; (setDarkTheme.s9 + 0)
.s8:
1fdd : e6 1c __ INC ACCU + 1 
.s9:
1fdf : a5 1c __ LDA ACCU + 1 
1fe1 : c9 db __ CMP #$db
1fe3 : 90 ee __ BCC $1fd3 ; (setDarkTheme.l5 + 0)
.s10:
1fe5 : d0 06 __ BNE $1fed ; (setDarkTheme.s6 + 0)
.s7:
1fe7 : a5 1b __ LDA ACCU + 0 
1fe9 : c9 e8 __ CMP #$e8
1feb : 90 e6 __ BCC $1fd3 ; (setDarkTheme.l5 + 0)
.s6:
1fed : 4c f0 1f JMP $1ff0 ; (setColorInfo.s4 + 0)
--------------------------------------------------------------------
setColorInfo: ; setColorInfo()->void
.s4:
1ff0 : a9 82 __ LDA #$82
1ff2 : 85 1b __ STA ACCU + 0 
1ff4 : a9 d8 __ LDA #$d8
1ff6 : 85 1c __ STA ACCU + 1 
.l5:
1ff8 : a9 04 __ LDA #$04
1ffa : a0 00 __ LDY #$00
1ffc : 91 1b __ STA (ACCU + 0),y 
1ffe : e6 1b __ INC ACCU + 0 
2000 : d0 02 __ BNE $2004 ; (setColorInfo.s11 + 0)
.s10:
2002 : e6 1c __ INC ACCU + 1 
.s11:
2004 : a5 1c __ LDA ACCU + 1 
2006 : c9 d8 __ CMP #$d8
2008 : 90 ee __ BCC $1ff8 ; (setColorInfo.l5 + 0)
.s14:
200a : d0 06 __ BNE $2012 ; (setColorInfo.s6 + 0)
.s9:
200c : a5 1b __ LDA ACCU + 0 
200e : c9 92 __ CMP #$92
2010 : 90 e6 __ BCC $1ff8 ; (setColorInfo.l5 + 0)
.s6:
2012 : 84 1b __ STY ACCU + 0 
2014 : a9 d8 __ LDA #$d8
2016 : 85 1c __ STA ACCU + 1 
.l7:
2018 : a9 0f __ LDA #$0f
201a : 91 1b __ STA (ACCU + 0),y 
201c : e6 1b __ INC ACCU + 0 
201e : d0 02 __ BNE $2022 ; (setColorInfo.s13 + 0)
.s12:
2020 : e6 1c __ INC ACCU + 1 
.s13:
2022 : a5 1c __ LDA ACCU + 1 
2024 : c9 d8 __ CMP #$d8
2026 : 90 f0 __ BCC $2018 ; (setColorInfo.l7 + 0)
.s15:
2028 : d0 06 __ BNE $2030 ; (setColorInfo.s3 + 0)
.s8:
202a : a5 1b __ LDA ACCU + 0 
202c : c9 28 __ CMP #$28
202e : 90 e8 __ BCC $2018 ; (setColorInfo.l7 + 0)
.s3:
2030 : 60 __ __ RTS
--------------------------------------------------------------------
putsxy: ; putsxy(u8,u8,const u8*)->void
.s4:
2031 : a0 00 __ LDY #$00
2033 : b1 0f __ LDA (P2),y ; (s + 0)
2035 : f0 3f __ BEQ $2076 ; (putsxy.s3 + 0)
.s5:
2037 : a5 0e __ LDA P1 ; (y + 0)
2039 : 0a __ __ ASL
203a : 85 1b __ STA ACCU + 0 
203c : 98 __ __ TYA
203d : 2a __ __ ROL
203e : 06 1b __ ASL ACCU + 0 
2040 : 2a __ __ ROL
2041 : aa __ __ TAX
2042 : 18 __ __ CLC
2043 : a5 1b __ LDA ACCU + 0 
2045 : 65 0e __ ADC P1 ; (y + 0)
2047 : 85 1b __ STA ACCU + 0 
2049 : 8a __ __ TXA
204a : 69 00 __ ADC #$00
204c : 06 1b __ ASL ACCU + 0 
204e : 2a __ __ ROL
204f : 06 1b __ ASL ACCU + 0 
2051 : 2a __ __ ROL
2052 : 06 1b __ ASL ACCU + 0 
2054 : 2a __ __ ROL
2055 : aa __ __ TAX
2056 : 18 __ __ CLC
2057 : a5 1b __ LDA ACCU + 0 
2059 : 65 0d __ ADC P0 ; (x + 0)
205b : 85 1b __ STA ACCU + 0 
205d : 8a __ __ TXA
205e : 69 04 __ ADC #$04
2060 : 85 1c __ STA ACCU + 1 
2062 : b1 0f __ LDA (P2),y ; (s + 0)
.l6:
2064 : 91 1b __ STA (ACCU + 0),y 
2066 : e6 1b __ INC ACCU + 0 
2068 : d0 02 __ BNE $206c ; (putsxy.s8 + 0)
.s7:
206a : e6 1c __ INC ACCU + 1 
.s8:
206c : e6 0f __ INC P2 ; (s + 0)
206e : d0 02 __ BNE $2072 ; (putsxy.s10 + 0)
.s9:
2070 : e6 10 __ INC P3 ; (s + 1)
.s10:
2072 : b1 0f __ LDA (P2),y ; (s + 0)
2074 : d0 ee __ BNE $2064 ; (putsxy.l6 + 0)
.s3:
2076 : 60 __ __ RTS
--------------------------------------------------------------------
2077 : __ __ __ BYT c1 4e 4f 54 48 45 52 20 c4 49 53 4b 20 c3 4f 50 : .NOTHER .ISK .OP
2087 : __ __ __ BYT 59 00                                           : Y.
--------------------------------------------------------------------
2089 : __ __ __ BYT c1 4e 44 59 20 ca 41 59 20 32 30 32 35 31 30 2e : .NDY .AY 202510.
2099 : __ __ __ BYT 31 00                                           : 1.
--------------------------------------------------------------------
keyb_poll: ; keyb_poll()->void
.s4:
209b : a9 ff __ LDA #$ff
209d : 8d 02 dc STA $dc02 
20a0 : 8d 00 dc STA $dc00 
20a3 : a9 00 __ LDA #$00
20a5 : 8d ce 30 STA $30ce ; (keyb_key + 0)
20a8 : ae 01 dc LDX $dc01 
20ab : e8 __ __ INX
20ac : d0 25 __ BNE $20d3 ; (keyb_poll.s3 + 0)
.s5:
20ae : 8d 03 dc STA $dc03 
20b1 : 8d 00 dc STA $dc00 
20b4 : ad 01 dc LDA $dc01 
20b7 : c9 ff __ CMP #$ff
20b9 : d0 1f __ BNE $20da ; (keyb_poll.s7 + 0)
.s6:
20bb : 8d cf 30 STA $30cf ; (keyb_matrix + 0)
20be : 8d d0 30 STA $30d0 ; (keyb_matrix + 1)
20c1 : 8d d1 30 STA $30d1 ; (keyb_matrix + 2)
20c4 : 8d d2 30 STA $30d2 ; (keyb_matrix + 3)
20c7 : 8d d3 30 STA $30d3 ; (keyb_matrix + 4)
20ca : 8d d4 30 STA $30d4 ; (keyb_matrix + 5)
20cd : 8d d5 30 STA $30d5 ; (keyb_matrix + 6)
20d0 : 8d d6 30 STA $30d6 ; (keyb_matrix + 7)
.s3:
20d3 : ad d7 30 LDA $30d7 ; (ciaa_pra_def + 0)
20d6 : 8d 00 dc STA $dc00 
20d9 : 60 __ __ RTS
.s7:
20da : ad d5 30 LDA $30d5 ; (keyb_matrix + 6)
20dd : 29 ef __ AND #$ef
20df : 8d d5 30 STA $30d5 ; (keyb_matrix + 6)
20e2 : ad d0 30 LDA $30d0 ; (keyb_matrix + 1)
20e5 : 29 7f __ AND #$7f
20e7 : 8d d0 30 STA $30d0 ; (keyb_matrix + 1)
20ea : a9 fe __ LDA #$fe
20ec : 85 1b __ STA ACCU + 0 
.l20:
20ee : a5 1b __ LDA ACCU + 0 
20f0 : 8d 00 dc STA $dc00 
20f3 : bd cf 30 LDA $30cf,x ; (keyb_matrix + 0)
20f6 : 85 1c __ STA ACCU + 1 
20f8 : ad 01 dc LDA $dc01 
20fb : 9d cf 30 STA $30cf,x ; (keyb_matrix + 0)
20fe : 49 ff __ EOR #$ff
2100 : 38 __ __ SEC
2101 : 26 1b __ ROL ACCU + 0 
2103 : 25 1c __ AND ACCU + 1 
2105 : f0 25 __ BEQ $212c ; (keyb_poll.s8 + 0)
.s13:
2107 : 85 1c __ STA ACCU + 1 
2109 : 8a __ __ TXA
210a : 0a __ __ ASL
210b : 0a __ __ ASL
210c : 0a __ __ ASL
210d : 09 80 __ ORA #$80
210f : a8 __ __ TAY
2110 : a5 1c __ LDA ACCU + 1 
2112 : 29 f0 __ AND #$f0
2114 : f0 04 __ BEQ $211a ; (keyb_poll.s14 + 0)
.s19:
2116 : 98 __ __ TYA
2117 : 09 04 __ ORA #$04
2119 : a8 __ __ TAY
.s14:
211a : a5 1c __ LDA ACCU + 1 
211c : 29 cc __ AND #$cc
211e : f0 02 __ BEQ $2122 ; (keyb_poll.s15 + 0)
.s18:
2120 : c8 __ __ INY
2121 : c8 __ __ INY
.s15:
2122 : a5 1c __ LDA ACCU + 1 
2124 : 29 aa __ AND #$aa
2126 : f0 01 __ BEQ $2129 ; (keyb_poll.s16 + 0)
.s17:
2128 : c8 __ __ INY
.s16:
2129 : 8c ce 30 STY $30ce ; (keyb_key + 0)
.s8:
212c : e8 __ __ INX
212d : e0 08 __ CPX #$08
212f : 90 bd __ BCC $20ee ; (keyb_poll.l20 + 0)
.s9:
2131 : ad ce 30 LDA $30ce ; (keyb_key + 0)
2134 : f0 9d __ BEQ $20d3 ; (keyb_poll.s3 + 0)
.s10:
2136 : 2c d0 30 BIT $30d0 ; (keyb_matrix + 1)
2139 : 10 07 __ BPL $2142 ; (keyb_poll.s11 + 0)
.s12:
213b : ad d5 30 LDA $30d5 ; (keyb_matrix + 6)
213e : 29 10 __ AND #$10
2140 : d0 91 __ BNE $20d3 ; (keyb_poll.s3 + 0)
.s11:
2142 : ad ce 30 LDA $30ce ; (keyb_key + 0)
2145 : 09 40 __ ORA #$40
2147 : 8d ce 30 STA $30ce ; (keyb_key + 0)
214a : b0 87 __ BCS $20d3 ; (keyb_poll.s3 + 0)
--------------------------------------------------------------------
drawBox: ; drawBox(u8,u8)->void
.s4:
214c : a5 11 __ LDA P4 ; (x + 0)
214e : 85 0d __ STA P0 
2150 : a5 12 __ LDA P5 ; (y + 0)
2152 : 85 0e __ STA P1 
2154 : a9 43 __ LDA #$43
2156 : 85 0f __ STA P2 
2158 : a9 30 __ LDA #$30
215a : 85 10 __ STA P3 
215c : 20 31 20 JSR $2031 ; (putsxy.s4 + 0)
215f : a6 12 __ LDX P5 ; (y + 0)
2161 : e8 __ __ INX
2162 : 86 0e __ STX P1 
2164 : a9 52 __ LDA #$52
2166 : 85 0f __ STA P2 
2168 : a9 30 __ LDA #$30
216a : 85 10 __ STA P3 
216c : 20 31 20 JSR $2031 ; (putsxy.s4 + 0)
216f : e6 0e __ INC P1 
2171 : a9 61 __ LDA #$61
2173 : 85 0f __ STA P2 
2175 : a9 30 __ LDA #$30
2177 : 85 10 __ STA P3 
2179 : 20 31 20 JSR $2031 ; (putsxy.s4 + 0)
217c : e6 0e __ INC P1 
217e : a9 70 __ LDA #$70
2180 : 85 0f __ STA P2 
2182 : a9 30 __ LDA #$30
2184 : 85 10 __ STA P3 
2186 : 20 31 20 JSR $2031 ; (putsxy.s4 + 0)
2189 : e6 0e __ INC P1 
218b : a9 7f __ LDA #$7f
218d : 85 0f __ STA P2 
218f : a9 30 __ LDA #$30
2191 : 85 10 __ STA P3 
2193 : 20 31 20 JSR $2031 ; (putsxy.s4 + 0)
2196 : e6 0e __ INC P1 
2198 : a9 8e __ LDA #$8e
219a : 85 0f __ STA P2 
219c : a9 30 __ LDA #$30
219e : 85 10 __ STA P3 
21a0 : 4c 31 20 JMP $2031 ; (putsxy.s4 + 0)
--------------------------------------------------------------------
set_sstr: ; set_sstr(struct sstr*,const u8*)->void
.s4:
21a3 : a0 00 __ LDY #$00
21a5 : b1 0f __ LDA (P2),y ; (src + 0)
21a7 : f0 0b __ BEQ $21b4 ; (set_sstr.s7 + 0)
.l5:
21a9 : c0 1f __ CPY #$1f
21ab : b0 07 __ BCS $21b4 ; (set_sstr.s7 + 0)
.s6:
21ad : c8 __ __ INY
21ae : 91 0d __ STA (P0),y ; (s + 0)
21b0 : b1 0f __ LDA (P2),y ; (src + 0)
21b2 : d0 f5 __ BNE $21a9 ; (set_sstr.l5 + 0)
.s7:
21b4 : 84 1b __ STY ACCU + 0 
21b6 : a9 00 __ LDA #$00
21b8 : c8 __ __ INY
21b9 : 91 0d __ STA (P0),y ; (s + 0)
21bb : a5 1b __ LDA ACCU + 0 
21bd : a0 00 __ LDY #$00
21bf : 91 0d __ STA (P0),y ; (s + 0)
.s3:
21c1 : 60 __ __ RTS
--------------------------------------------------------------------
21c2 : __ __ __ BYT 49 4e 20 00                                     : IN .
--------------------------------------------------------------------
append_sstr_num: ; append_sstr_num(struct sstr*,i16)->void
.s4:
21c6 : a5 15 __ LDA P8 ; (num + 0)
21c8 : 85 0d __ STA P0 
21ca : a5 16 __ LDA P9 ; (num + 1)
21cc : 85 0e __ STA P1 
21ce : a9 0a __ LDA #$0a
21d0 : 85 11 __ STA P4 
21d2 : a9 bf __ LDA #$bf
21d4 : 85 10 __ STA P3 
21d6 : a9 00 __ LDA #$00
21d8 : 85 12 __ STA P5 
21da : a9 ea __ LDA #$ea
21dc : 85 0f __ STA P2 
21de : 20 ec 21 JSR $21ec ; (itoa.s4 + 0)
21e1 : a5 13 __ LDA P6 ; (s + 0)
21e3 : 85 0d __ STA P0 
21e5 : a5 14 __ LDA P7 ; (s + 1)
21e7 : 85 0e __ STA P1 
21e9 : 4c 95 22 JMP $2295 ; (append_sstr.s4 + 0)
--------------------------------------------------------------------
itoa: ; itoa(i16,u8*,u16)->void
.s4:
21ec : 24 0e __ BIT P1 ; (n + 1)
21ee : 10 15 __ BPL $2205 ; (itoa.s6 + 0)
.s5:
21f0 : a9 01 __ LDA #$01
21f2 : 85 43 __ STA T5 + 0 
21f4 : 38 __ __ SEC
21f5 : a9 00 __ LDA #$00
21f7 : e5 0d __ SBC P0 ; (n + 0)
21f9 : 85 0d __ STA P0 ; (n + 0)
21fb : a9 00 __ LDA #$00
21fd : e5 0e __ SBC P1 ; (n + 1)
21ff : 85 0e __ STA P1 ; (n + 1)
2201 : a9 00 __ LDA #$00
2203 : f0 04 __ BEQ $2209 ; (itoa.s7 + 0)
.s6:
2205 : a9 00 __ LDA #$00
2207 : 85 43 __ STA T5 + 0 
.s7:
2209 : 85 44 __ STA T6 + 0 
.l8:
220b : a5 0d __ LDA P0 ; (n + 0)
220d : 85 1b __ STA ACCU + 0 
220f : a5 0e __ LDA P1 ; (n + 1)
2211 : 85 1c __ STA ACCU + 1 
2213 : a5 11 __ LDA P4 ; (radix + 0)
2215 : 85 03 __ STA WORK + 0 
2217 : a5 12 __ LDA P5 ; (radix + 1)
2219 : 85 04 __ STA WORK + 1 
221b : 20 be 2f JSR $2fbe ; (divmod + 0)
221e : a5 06 __ LDA WORK + 3 
2220 : f0 08 __ BEQ $222a ; (itoa.s18 + 0)
.s19:
2222 : a5 05 __ LDA WORK + 2 
.s9:
2224 : 18 __ __ CLC
2225 : 69 37 __ ADC #$37
2227 : 4c 32 22 JMP $2232 ; (itoa.s10 + 0)
.s18:
222a : a5 05 __ LDA WORK + 2 
222c : c9 0a __ CMP #$0a
222e : b0 f4 __ BCS $2224 ; (itoa.s9 + 0)
.s17:
2230 : 09 30 __ ORA #$30
.s10:
2232 : a4 44 __ LDY T6 + 0 
2234 : 91 0f __ STA (P2),y ; (s + 0)
2236 : a5 0d __ LDA P0 ; (n + 0)
2238 : 85 1b __ STA ACCU + 0 
223a : a5 0e __ LDA P1 ; (n + 1)
223c : 85 1c __ STA ACCU + 1 
223e : a5 11 __ LDA P4 ; (radix + 0)
2240 : 85 03 __ STA WORK + 0 
2242 : a5 12 __ LDA P5 ; (radix + 1)
2244 : 85 04 __ STA WORK + 1 
2246 : 20 be 2f JSR $2fbe ; (divmod + 0)
2249 : a5 1b __ LDA ACCU + 0 
224b : 85 0d __ STA P0 ; (n + 0)
224d : a6 44 __ LDX T6 + 0 
224f : e6 44 __ INC T6 + 0 
2251 : a5 1c __ LDA ACCU + 1 
2253 : 85 0e __ STA P1 ; (n + 1)
2255 : 05 0d __ ORA P0 ; (n + 0)
2257 : d0 b2 __ BNE $220b ; (itoa.l8 + 0)
.s11:
2259 : a5 43 __ LDA T5 + 0 
225b : f0 0a __ BEQ $2267 ; (itoa.s12 + 0)
.s16:
225d : a9 2d __ LDA #$2d
225f : e8 __ __ INX
2260 : a4 44 __ LDY T6 + 0 
2262 : e8 __ __ INX
2263 : 86 44 __ STX T6 + 0 
2265 : 91 0f __ STA (P2),y ; (s + 0)
.s12:
2267 : a9 00 __ LDA #$00
2269 : a4 44 __ LDY T6 + 0 
226b : 91 0f __ STA (P2),y ; (s + 0)
226d : 85 1b __ STA ACCU + 0 
226f : 4c 88 22 JMP $2288 ; (itoa.l13 + 0)
.s14:
2272 : a4 1b __ LDY ACCU + 0 
2274 : b1 0f __ LDA (P2),y ; (s + 0)
2276 : c6 44 __ DEC T6 + 0 
2278 : aa __ __ TAX
2279 : a4 44 __ LDY T6 + 0 
227b : b1 0f __ LDA (P2),y ; (s + 0)
227d : a4 1b __ LDY ACCU + 0 
227f : 91 0f __ STA (P2),y ; (s + 0)
2281 : 8a __ __ TXA
2282 : a4 44 __ LDY T6 + 0 
2284 : 91 0f __ STA (P2),y ; (s + 0)
2286 : e6 1b __ INC ACCU + 0 
.l13:
2288 : 18 __ __ CLC
2289 : a5 1b __ LDA ACCU + 0 
228b : 69 01 __ ADC #$01
228d : aa __ __ TAX
228e : b0 04 __ BCS $2294 ; (itoa.s3 + 0)
.s15:
2290 : e4 44 __ CPX T6 + 0 
2292 : 90 de __ BCC $2272 ; (itoa.s14 + 0)
.s3:
2294 : 60 __ __ RTS
--------------------------------------------------------------------
append_sstr: ; append_sstr(struct sstr*,const u8*)->void
.s4:
2295 : a0 00 __ LDY #$00
2297 : 84 1b __ STY ACCU + 0 
2299 : b1 0d __ LDA (P0),y ; (s + 0)
229b : 85 1c __ STA ACCU + 1 
229d : b1 0f __ LDA (P2),y ; (src + 0)
229f : f0 13 __ BEQ $22b4 ; (append_sstr.s8 + 0)
.l6:
22a1 : a4 1c __ LDY ACCU + 1 
22a3 : c0 1f __ CPY #$1f
22a5 : b0 0f __ BCS $22b6 ; (append_sstr.s5 + 0)
.s7:
22a7 : c8 __ __ INY
22a8 : 84 1c __ STY ACCU + 1 
22aa : 91 0d __ STA (P0),y ; (s + 0)
22ac : e6 1b __ INC ACCU + 0 
22ae : a4 1b __ LDY ACCU + 0 
22b0 : b1 0f __ LDA (P2),y ; (src + 0)
22b2 : d0 ed __ BNE $22a1 ; (append_sstr.l6 + 0)
.s8:
22b4 : a4 1c __ LDY ACCU + 1 
.s5:
22b6 : a9 00 __ LDA #$00
22b8 : c8 __ __ INY
22b9 : 91 0d __ STA (P0),y ; (s + 0)
22bb : a5 1c __ LDA ACCU + 1 
22bd : a0 00 __ LDY #$00
22bf : 91 0d __ STA (P0),y ; (s + 0)
.s3:
22c1 : 60 __ __ RTS
--------------------------------------------------------------------
22c2 : __ __ __ BYT 4f 55 54 20 00                                  : OUT .
--------------------------------------------------------------------
22c7 : __ __ __ BYT 53 57 41 50 20 3f 28 d9 2f ce 29 00             : SWAP ?(./.).
--------------------------------------------------------------------
getch: ; getch()->u8
.l4:
22d3 : 20 e4 ff JSR $ffe4 
22d6 : 85 1b __ STA ACCU + 0 
22d8 : a5 1b __ LDA ACCU + 0 
22da : f0 f7 __ BEQ $22d3 ; (getch.l4 + 0)
.s5:
22dc : 4c df 22 JMP $22df ; (convch.s4 + 0)
--------------------------------------------------------------------
convch: ; convch(u8)->u8
.s4:
22df : a8 __ __ TAY
22e0 : ad ff 2e LDA $2eff ; (giocharmap + 0)
22e3 : f0 27 __ BEQ $230c ; (convch.s5 + 0)
.s6:
22e5 : c0 0d __ CPY #$0d
22e7 : d0 03 __ BNE $22ec ; (convch.s7 + 0)
.s16:
22e9 : a9 0a __ LDA #$0a
.s3:
22eb : 60 __ __ RTS
.s7:
22ec : c9 02 __ CMP #$02
22ee : 90 1c __ BCC $230c ; (convch.s5 + 0)
.s8:
22f0 : 98 __ __ TYA
22f1 : c0 41 __ CPY #$41
22f3 : 90 17 __ BCC $230c ; (convch.s5 + 0)
.s9:
22f5 : c9 db __ CMP #$db
22f7 : b0 13 __ BCS $230c ; (convch.s5 + 0)
.s10:
22f9 : c9 c1 __ CMP #$c1
22fb : 90 03 __ BCC $2300 ; (convch.s11 + 0)
.s15:
22fd : 49 a0 __ EOR #$a0
22ff : a8 __ __ TAY
.s11:
2300 : c9 7b __ CMP #$7b
2302 : b0 08 __ BCS $230c ; (convch.s5 + 0)
.s12:
2304 : c9 61 __ CMP #$61
2306 : b0 06 __ BCS $230e ; (convch.s14 + 0)
.s13:
2308 : c9 5b __ CMP #$5b
230a : 90 02 __ BCC $230e ; (convch.s14 + 0)
.s5:
230c : 98 __ __ TYA
230d : 60 __ __ RTS
.s14:
230e : 49 20 __ EOR #$20
2310 : 60 __ __ RTS
--------------------------------------------------------------------
resetCPU: ; resetCPU()->void
.s4:
2311 : 4c 3d ff JMP $ff3d 
.s3:
2314 : 60 __ __ RTS
--------------------------------------------------------------------
getDriveInfo: ; getDriveInfo(u8)->i16
.s4:
2315 : a9 a7 __ LDA #$a7
2317 : 85 0d __ STA P0 
2319 : a9 23 __ LDA #$23
231b : 85 0e __ STA P1 
231d : 20 91 23 JSR $2391 ; (krnio_setnam.s4 + 0)
2320 : a9 0f __ LDA #$0f
2322 : 85 0d __ STA P0 
2324 : 85 0f __ STA P2 
2326 : a5 13 __ LDA P6 ; (driveid + 0)
2328 : 85 0e __ STA P1 
232a : 20 a8 23 JSR $23a8 ; (krnio_open.s4 + 0)
232d : aa __ __ TAX
232e : d0 07 __ BNE $2337 ; (getDriveInfo.s6 + 0)
.s5:
2330 : a9 ff __ LDA #$ff
2332 : 85 1b __ STA ACCU + 0 
.s3:
2334 : 85 1c __ STA ACCU + 1 
2336 : 60 __ __ RTS
.s6:
2337 : a9 0f __ LDA #$0f
2339 : 85 0e __ STA P1 
233b : a9 24 __ LDA #$24
233d : 85 10 __ STA P3 
233f : a9 40 __ LDA #$40
2341 : 85 0f __ STA P2 
2343 : 20 d6 23 JSR $23d6 ; (krnio_puts.s4 + 0)
2346 : a5 1b __ LDA ACCU + 0 
2348 : 85 47 __ STA T0 + 0 
234a : a5 1c __ LDA ACCU + 1 
234c : 85 48 __ STA T0 + 1 
234e : 30 33 __ BMI $2383 ; (getDriveInfo.s8 + 0)
.s9:
2350 : 05 1b __ ORA ACCU + 0 
2352 : f0 2f __ BEQ $2383 ; (getDriveInfo.s8 + 0)
.s7:
2354 : a9 0f __ LDA #$0f
2356 : 85 0e __ STA P1 
2358 : a9 bf __ LDA #$bf
235a : 85 10 __ STA P3 
235c : a9 20 __ LDA #$20
235e : 85 11 __ STA P4 
2360 : a9 00 __ LDA #$00
2362 : 85 12 __ STA P5 
2364 : a9 c6 __ LDA #$c6
2366 : 85 0f __ STA P2 
2368 : 20 4b 24 JSR $244b ; (krnio_read.s4 + 0)
236b : a9 00 __ LDA #$00
236d : 8d e5 bf STA $bfe5 ; (tmpbuf + 31)
2370 : a9 d6 __ LDA #$d6
2372 : 85 0d __ STA P0 
2374 : a9 bf __ LDA #$bf
2376 : 85 0e __ STA P1 
2378 : 20 ea 24 JSR $24ea ; (atoi.l4 + 0)
237b : a5 1b __ LDA ACCU + 0 
237d : 85 47 __ STA T0 + 0 
237f : a5 1c __ LDA ACCU + 1 
2381 : 85 48 __ STA T0 + 1 
.s8:
2383 : a9 0f __ LDA #$0f
2385 : 20 43 24 JSR $2443 ; (krnio_close.s4 + 0)
2388 : a5 47 __ LDA T0 + 0 
238a : 85 1b __ STA ACCU + 0 
238c : a5 48 __ LDA T0 + 1 
238e : 4c 34 23 JMP $2334 ; (getDriveInfo.s3 + 0)
--------------------------------------------------------------------
krnio_setnam: ; krnio_setnam(const u8*)->void
.s4:
2391 : a5 0d __ LDA P0 
2393 : 05 0e __ ORA P1 
2395 : f0 08 __ BEQ $239f ; (krnio_setnam.s4 + 14)
2397 : a0 ff __ LDY #$ff
2399 : c8 __ __ INY
239a : b1 0d __ LDA (P0),y 
239c : d0 fb __ BNE $2399 ; (krnio_setnam.s4 + 8)
239e : 98 __ __ TYA
239f : a6 0d __ LDX P0 
23a1 : a4 0e __ LDY P1 
23a3 : 20 bd ff JSR $ffbd 
.s3:
23a6 : 60 __ __ RTS
--------------------------------------------------------------------
23a7 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
krnio_open: ; krnio_open(u8,u8,u8)->bool
.s4:
23a8 : a9 00 __ LDA #$00
23aa : a6 0d __ LDX P0 ; (fnum + 0)
23ac : 9d d8 30 STA $30d8,x ; (krnio_pstatus + 0)
23af : a9 00 __ LDA #$00
23b1 : 85 1b __ STA ACCU + 0 
23b3 : 85 1c __ STA ACCU + 1 
23b5 : a5 0d __ LDA P0 ; (fnum + 0)
23b7 : a6 0e __ LDX P1 
23b9 : a4 0f __ LDY P2 
23bb : 20 ba ff JSR $ffba 
23be : 20 c0 ff JSR $ffc0 
23c1 : 90 08 __ BCC $23cb ; (krnio_open.s4 + 35)
23c3 : a5 0d __ LDA P0 ; (fnum + 0)
23c5 : 20 c3 ff JSR $ffc3 
23c8 : 4c cf 23 JMP $23cf ; (krnio_open.s4 + 39)
23cb : a9 01 __ LDA #$01
23cd : 85 1b __ STA ACCU + 0 
23cf : a5 1b __ LDA ACCU + 0 
23d1 : f0 02 __ BEQ $23d5 ; (krnio_open.s3 + 0)
.s5:
23d3 : a9 01 __ LDA #$01
.s3:
23d5 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_puts: ; krnio_puts(u8,const u8*)->i16
.s4:
23d6 : a5 0e __ LDA P1 ; (fnum + 0)
23d8 : 20 17 24 JSR $2417 ; (krnio_chkout.s4 + 0)
23db : aa __ __ TAX
23dc : d0 07 __ BNE $23e5 ; (krnio_puts.s6 + 0)
.s5:
23de : a9 ff __ LDA #$ff
23e0 : 85 1b __ STA ACCU + 0 
.s3:
23e2 : 85 1c __ STA ACCU + 1 
23e4 : 60 __ __ RTS
.s6:
23e5 : a9 00 __ LDA #$00
23e7 : 85 43 __ STA T0 + 0 
23e9 : 85 44 __ STA T0 + 1 
23eb : a5 0f __ LDA P2 ; (data + 0)
23ed : 85 45 __ STA T1 + 0 
23ef : a5 10 __ LDA P3 ; (data + 1)
23f1 : 85 46 __ STA T1 + 1 
.l11:
23f3 : a0 00 __ LDY #$00
23f5 : b1 45 __ LDA (T1 + 0),y 
23f7 : d0 0c __ BNE $2405 ; (krnio_puts.s8 + 0)
.s7:
23f9 : 20 3c 24 JSR $243c ; (krnio_clrchn.s4 + 0)
23fc : a5 43 __ LDA T0 + 0 
23fe : 85 1b __ STA ACCU + 0 
2400 : a5 44 __ LDA T0 + 1 
2402 : 4c e2 23 JMP $23e2 ; (krnio_puts.s3 + 0)
.s8:
2405 : 20 2c 24 JSR $242c ; (krnio_chrout.s4 + 0)
2408 : e6 43 __ INC T0 + 0 
240a : d0 02 __ BNE $240e ; (krnio_puts.s10 + 0)
.s9:
240c : e6 44 __ INC T0 + 1 
.s10:
240e : e6 45 __ INC T1 + 0 
2410 : d0 e1 __ BNE $23f3 ; (krnio_puts.l11 + 0)
.s12:
2412 : e6 46 __ INC T1 + 1 
2414 : 4c f3 23 JMP $23f3 ; (krnio_puts.l11 + 0)
--------------------------------------------------------------------
krnio_chkout: ; krnio_chkout(u8)->bool
.s4:
2417 : 85 0d __ STA P0 
2419 : a6 0d __ LDX P0 
241b : 20 c9 ff JSR $ffc9 
241e : a9 00 __ LDA #$00
2420 : 2a __ __ ROL
2421 : 49 01 __ EOR #$01
2423 : 85 1b __ STA ACCU + 0 
2425 : a5 1b __ LDA ACCU + 0 
2427 : f0 02 __ BEQ $242b ; (krnio_chkout.s3 + 0)
.s5:
2429 : a9 01 __ LDA #$01
.s3:
242b : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrout: ; krnio_chrout(u8)->bool
.s4:
242c : 85 0d __ STA P0 
242e : a5 0d __ LDA P0 
2430 : 20 d2 ff JSR $ffd2 
2433 : 85 1b __ STA ACCU + 0 
2435 : a5 1b __ LDA ACCU + 0 
2437 : f0 02 __ BEQ $243b ; (krnio_chrout.s3 + 0)
.s5:
2439 : a9 01 __ LDA #$01
.s3:
243b : 60 __ __ RTS
--------------------------------------------------------------------
krnio_clrchn: ; krnio_clrchn()->void
.s4:
243c : 20 cc ff JSR $ffcc 
.s3:
243f : 60 __ __ RTS
--------------------------------------------------------------------
2440 : __ __ __ BYT 55 49 00                                        : UI.
--------------------------------------------------------------------
krnio_close: ; krnio_close(u8)->void
.s4:
2443 : 85 0d __ STA P0 
2445 : a5 0d __ LDA P0 
2447 : 20 c3 ff JSR $ffc3 
.s3:
244a : 60 __ __ RTS
--------------------------------------------------------------------
krnio_read: ; krnio_read(u8,u8*,i16)->i16
.s4:
244b : a6 0e __ LDX P1 ; (fnum + 0)
244d : bd d8 30 LDA $30d8,x ; (krnio_pstatus + 0)
2450 : c9 40 __ CMP #$40
2452 : d0 07 __ BNE $245b ; (krnio_read.s5 + 0)
.s15:
2454 : a9 00 __ LDA #$00
.s16:
2456 : 85 1b __ STA ACCU + 0 
.s3:
2458 : 85 1c __ STA ACCU + 1 
245a : 60 __ __ RTS
.s5:
245b : 86 44 __ STX T2 + 0 
245d : 8a __ __ TXA
245e : 20 c1 24 JSR $24c1 ; (krnio_chkin.s4 + 0)
2461 : aa __ __ TAX
2462 : d0 04 __ BNE $2468 ; (krnio_read.s7 + 0)
.s6:
2464 : a9 ff __ LDA #$ff
2466 : d0 ee __ BNE $2456 ; (krnio_read.s16 + 0)
.s7:
2468 : a9 00 __ LDA #$00
246a : 85 45 __ STA T3 + 0 
246c : 85 46 __ STA T3 + 1 
246e : a5 12 __ LDA P5 ; (num + 1)
2470 : 30 43 __ BMI $24b5 ; (krnio_read.s8 + 0)
.s14:
2472 : 05 11 __ ORA P4 ; (num + 0)
2474 : f0 3f __ BEQ $24b5 ; (krnio_read.s8 + 0)
.l9:
2476 : 20 d6 24 JSR $24d6 ; (krnio_chrin.s4 + 0)
2479 : 85 43 __ STA T0 + 0 
247b : 20 de 24 JSR $24de ; (krnio_status.s4 + 0)
247e : 85 1d __ STA ACCU + 2 
2480 : a6 44 __ LDX T2 + 0 
2482 : 9d d8 30 STA $30d8,x ; (krnio_pstatus + 0)
2485 : aa __ __ TAX
2486 : f0 04 __ BEQ $248c ; (krnio_read.s10 + 0)
.s13:
2488 : c9 40 __ CMP #$40
248a : d0 29 __ BNE $24b5 ; (krnio_read.s8 + 0)
.s10:
248c : a5 45 __ LDA T3 + 0 
248e : 85 1b __ STA ACCU + 0 
2490 : 18 __ __ CLC
2491 : a5 10 __ LDA P3 ; (data + 1)
2493 : 65 46 __ ADC T3 + 1 
2495 : 85 1c __ STA ACCU + 1 
2497 : a5 43 __ LDA T0 + 0 
2499 : a4 0f __ LDY P2 ; (data + 0)
249b : 91 1b __ STA (ACCU + 0),y 
249d : e6 45 __ INC T3 + 0 
249f : d0 02 __ BNE $24a3 ; (krnio_read.s18 + 0)
.s17:
24a1 : e6 46 __ INC T3 + 1 
.s18:
24a3 : a5 1d __ LDA ACCU + 2 
24a5 : d0 0e __ BNE $24b5 ; (krnio_read.s8 + 0)
.s11:
24a7 : a5 46 __ LDA T3 + 1 
24a9 : c5 12 __ CMP P5 ; (num + 1)
24ab : 90 c9 __ BCC $2476 ; (krnio_read.l9 + 0)
.s19:
24ad : d0 06 __ BNE $24b5 ; (krnio_read.s8 + 0)
.s12:
24af : a5 45 __ LDA T3 + 0 
24b1 : c5 11 __ CMP P4 ; (num + 0)
24b3 : 90 c1 __ BCC $2476 ; (krnio_read.l9 + 0)
.s8:
24b5 : 20 3c 24 JSR $243c ; (krnio_clrchn.s4 + 0)
24b8 : a5 45 __ LDA T3 + 0 
24ba : 85 1b __ STA ACCU + 0 
24bc : a5 46 __ LDA T3 + 1 
24be : 4c 58 24 JMP $2458 ; (krnio_read.s3 + 0)
--------------------------------------------------------------------
krnio_chkin: ; krnio_chkin(u8)->bool
.s4:
24c1 : 85 0d __ STA P0 
24c3 : a6 0d __ LDX P0 
24c5 : 20 c6 ff JSR $ffc6 
24c8 : a9 00 __ LDA #$00
24ca : 2a __ __ ROL
24cb : 49 01 __ EOR #$01
24cd : 85 1b __ STA ACCU + 0 
24cf : a5 1b __ LDA ACCU + 0 
24d1 : f0 02 __ BEQ $24d5 ; (krnio_chkin.s3 + 0)
.s5:
24d3 : a9 01 __ LDA #$01
.s3:
24d5 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrin: ; krnio_chrin()->u8
.s4:
24d6 : 20 cf ff JSR $ffcf 
24d9 : 85 1b __ STA ACCU + 0 
.s3:
24db : a5 1b __ LDA ACCU + 0 
24dd : 60 __ __ RTS
--------------------------------------------------------------------
krnio_status: ; krnio_status()->enum krnioerr
.s4:
24de : 20 b7 ff JSR $ffb7 
24e1 : 85 1b __ STA ACCU + 0 
24e3 : a9 00 __ LDA #$00
24e5 : 85 1c __ STA ACCU + 1 
.s3:
24e7 : a5 1b __ LDA ACCU + 0 
24e9 : 60 __ __ RTS
--------------------------------------------------------------------
atoi: ; atoi(const u8*)->i16
.l4:
24ea : a0 00 __ LDY #$00
24ec : b1 0d __ LDA (P0),y ; (s + 0)
24ee : aa __ __ TAX
24ef : a5 0d __ LDA P0 ; (s + 0)
24f1 : 85 43 __ STA T0 + 0 
24f3 : 18 __ __ CLC
24f4 : 69 01 __ ADC #$01
24f6 : 85 0d __ STA P0 ; (s + 0)
24f8 : a5 0e __ LDA P1 ; (s + 1)
24fa : 85 44 __ STA T0 + 1 
24fc : 69 00 __ ADC #$00
24fe : 85 0e __ STA P1 ; (s + 1)
2500 : 8a __ __ TXA
2501 : e0 21 __ CPX #$21
2503 : b0 08 __ BCS $250d ; (atoi.s5 + 0)
.s16:
2505 : aa __ __ TAX
2506 : d0 e2 __ BNE $24ea ; (atoi.l4 + 0)
.s17:
2508 : 85 1b __ STA ACCU + 0 
.s3:
250a : 85 1c __ STA ACCU + 1 
250c : 60 __ __ RTS
.s5:
250d : e0 2d __ CPX #$2d
250f : d0 1d __ BNE $252e ; (atoi.s6 + 0)
.s15:
2511 : a9 01 __ LDA #$01
2513 : 85 1d __ STA ACCU + 2 
.s14:
2515 : 18 __ __ CLC
2516 : a5 43 __ LDA T0 + 0 
2518 : 69 02 __ ADC #$02
251a : 85 0d __ STA P0 ; (s + 0)
251c : a5 44 __ LDA T0 + 1 
251e : 69 00 __ ADC #$00
2520 : 85 0e __ STA P1 ; (s + 1)
2522 : a0 01 __ LDY #$01
2524 : b1 43 __ LDA (T0 + 0),y 
.s7:
2526 : 85 1c __ STA ACCU + 1 
2528 : a9 00 __ LDA #$00
252a : 85 43 __ STA T0 + 0 
252c : f0 08 __ BEQ $2536 ; (atoi.l8 + 0)
.s6:
252e : 84 1d __ STY ACCU + 2 
2530 : e0 2b __ CPX #$2b
2532 : d0 f2 __ BNE $2526 ; (atoi.s7 + 0)
2534 : f0 df __ BEQ $2515 ; (atoi.s14 + 0)
.l8:
2536 : 85 44 __ STA T0 + 1 
2538 : a5 1c __ LDA ACCU + 1 
253a : c9 30 __ CMP #$30
253c : 90 3b __ BCC $2579 ; (atoi.s9 + 0)
.s12:
253e : c9 3a __ CMP #$3a
2540 : b0 37 __ BCS $2579 ; (atoi.s9 + 0)
.s13:
2542 : a0 00 __ LDY #$00
2544 : b1 0d __ LDA (P0),y ; (s + 0)
2546 : a8 __ __ TAY
2547 : e6 0d __ INC P0 ; (s + 0)
2549 : d0 02 __ BNE $254d ; (atoi.s19 + 0)
.s18:
254b : e6 0e __ INC P1 ; (s + 1)
.s19:
254d : a5 43 __ LDA T0 + 0 
254f : 0a __ __ ASL
2550 : 85 1b __ STA ACCU + 0 
2552 : a5 44 __ LDA T0 + 1 
2554 : 2a __ __ ROL
2555 : 06 1b __ ASL ACCU + 0 
2557 : 2a __ __ ROL
2558 : aa __ __ TAX
2559 : 18 __ __ CLC
255a : a5 1b __ LDA ACCU + 0 
255c : 65 43 __ ADC T0 + 0 
255e : 85 43 __ STA T0 + 0 
2560 : 8a __ __ TXA
2561 : 65 44 __ ADC T0 + 1 
2563 : 06 43 __ ASL T0 + 0 
2565 : 2a __ __ ROL
2566 : aa __ __ TAX
2567 : a5 1c __ LDA ACCU + 1 
2569 : 84 1c __ STY ACCU + 1 
256b : 38 __ __ SEC
256c : e9 30 __ SBC #$30
256e : 18 __ __ CLC
256f : 65 43 __ ADC T0 + 0 
2571 : 85 43 __ STA T0 + 0 
2573 : 8a __ __ TXA
2574 : 69 00 __ ADC #$00
2576 : 4c 36 25 JMP $2536 ; (atoi.l8 + 0)
.s9:
2579 : a5 1d __ LDA ACCU + 2 
257b : d0 09 __ BNE $2586 ; (atoi.s11 + 0)
.s10:
257d : a5 43 __ LDA T0 + 0 
257f : 85 1b __ STA ACCU + 0 
2581 : a5 44 __ LDA T0 + 1 
2583 : 4c 0a 25 JMP $250a ; (atoi.s3 + 0)
.s11:
2586 : 38 __ __ SEC
2587 : a9 00 __ LDA #$00
2589 : e5 43 __ SBC T0 + 0 
258b : 85 1b __ STA ACCU + 0 
258d : a9 00 __ LDA #$00
258f : e5 44 __ SBC T0 + 1 
2591 : 4c 0a 25 JMP $250a ; (atoi.s3 + 0)
--------------------------------------------------------------------
2594 : __ __ __ BYT 3f 00                                           : ?.
--------------------------------------------------------------------
2596 : __ __ __ BYT 50 52 45 53 53 20 c3 20 46 4f 52 20 43 4f 4d 50 : PRESS . FOR COMP
25a6 : __ __ __ BYT 4c 45 54 45 20 43 4f 50 59 00                   : LETE COPY.
--------------------------------------------------------------------
25b0 : __ __ __ BYT 50 52 45 53 53 20 cf 20 46 4f 52 20 4f 50 54 49 : PRESS . FOR OPTI
25c0 : __ __ __ BYT 4d 49 5a 45 44 20 43 4f 50 59 00                : MIZED COPY.
--------------------------------------------------------------------
25cb : __ __ __ BYT 4f 52 20 d1 20 54 4f 20 51 55 49 54 00          : OR . TO QUIT.
--------------------------------------------------------------------
printTrackNumbers: ; printTrackNumbers()->void
.s4:
25d8 : a9 01 __ LDA #$01
25da : 85 45 __ STA T1 + 0 
25dc : a9 03 __ LDA #$03
25de : 85 46 __ STA T2 + 0 
.l5:
25e0 : a9 c8 __ LDA #$c8
25e2 : 85 0d __ STA P0 
25e4 : a9 23 __ LDA #$23
25e6 : 85 10 __ STA P3 
25e8 : a9 bf __ LDA #$bf
25ea : 85 0e __ STA P1 
25ec : a9 a7 __ LDA #$a7
25ee : 85 0f __ STA P2 
25f0 : 20 a3 21 JSR $21a3 ; (set_sstr.s4 + 0)
25f3 : a5 45 __ LDA T1 + 0 
25f5 : 85 1b __ STA ACCU + 0 
25f7 : a9 c8 __ LDA #$c8
25f9 : 85 13 __ STA P6 
25fb : a9 bf __ LDA #$bf
25fd : 85 14 __ STA P7 
25ff : a9 00 __ LDA #$00
2601 : 85 1c __ STA ACCU + 1 
2603 : 85 04 __ STA WORK + 1 
2605 : a9 0a __ LDA #$0a
2607 : 85 03 __ STA WORK + 0 
2609 : 20 be 2f JSR $2fbe ; (divmod + 0)
260c : a5 05 __ LDA WORK + 2 
260e : 85 47 __ STA T8 + 0 
2610 : a5 06 __ LDA WORK + 3 
2612 : 85 48 __ STA T8 + 1 
2614 : a5 1b __ LDA ACCU + 0 
2616 : 85 15 __ STA P8 
2618 : a5 1c __ LDA ACCU + 1 
261a : 85 16 __ STA P9 
261c : 20 c6 21 JSR $21c6 ; (append_sstr_num.s4 + 0)
261f : a5 46 __ LDA T2 + 0 
2621 : 85 0d __ STA P0 
2623 : a9 01 __ LDA #$01
2625 : 85 0e __ STA P1 
2627 : a9 bf __ LDA #$bf
2629 : 85 10 __ STA P3 
262b : a9 c9 __ LDA #$c9
262d : 85 0f __ STA P2 
262f : 20 31 20 JSR $2031 ; (putsxy.s4 + 0)
2632 : a9 c8 __ LDA #$c8
2634 : 85 0d __ STA P0 
2636 : a9 23 __ LDA #$23
2638 : 85 10 __ STA P3 
263a : a9 bf __ LDA #$bf
263c : 85 0e __ STA P1 
263e : a9 a7 __ LDA #$a7
2640 : 85 0f __ STA P2 
2642 : 20 a3 21 JSR $21a3 ; (set_sstr.s4 + 0)
2645 : a5 47 __ LDA T8 + 0 
2647 : 85 15 __ STA P8 
2649 : a5 48 __ LDA T8 + 1 
264b : 85 16 __ STA P9 
264d : 20 c6 21 JSR $21c6 ; (append_sstr_num.s4 + 0)
2650 : a5 46 __ LDA T2 + 0 
2652 : 85 0d __ STA P0 
2654 : e6 46 __ INC T2 + 0 
2656 : a9 02 __ LDA #$02
2658 : 85 0e __ STA P1 
265a : a9 bf __ LDA #$bf
265c : 85 10 __ STA P3 
265e : a9 c9 __ LDA #$c9
2660 : 85 0f __ STA P2 
2662 : 20 31 20 JSR $2031 ; (putsxy.s4 + 0)
2665 : e6 45 __ INC T1 + 0 
2667 : a5 45 __ LDA T1 + 0 
2669 : c9 24 __ CMP #$24
266b : b0 03 __ BCS $2670 ; (printTrackNumbers.s3 + 0)
266d : 4c e0 25 JMP $25e0 ; (printTrackNumbers.l5 + 0)
.s3:
2670 : 60 __ __ RTS
--------------------------------------------------------------------
printSectorNumbers: ; printSectorNumbers()->void
.s4:
2671 : a9 00 __ LDA #$00
2673 : 85 16 __ STA P9 
2675 : 85 15 __ STA P8 
2677 : a9 04 __ LDA #$04
2679 : 85 45 __ STA T1 + 0 
.l5:
267b : a9 c8 __ LDA #$c8
267d : 85 0d __ STA P0 
267f : a9 23 __ LDA #$23
2681 : 85 10 __ STA P3 
2683 : a9 bf __ LDA #$bf
2685 : 85 0e __ STA P1 
2687 : a9 a7 __ LDA #$a7
2689 : 85 0f __ STA P2 
268b : 20 a3 21 JSR $21a3 ; (set_sstr.s4 + 0)
268e : a9 c8 __ LDA #$c8
2690 : 85 13 __ STA P6 
2692 : a9 bf __ LDA #$bf
2694 : 85 14 __ STA P7 
2696 : 20 c6 21 JSR $21c6 ; (append_sstr_num.s4 + 0)
2699 : a5 45 __ LDA T1 + 0 
269b : 85 0e __ STA P1 
269d : a9 00 __ LDA #$00
269f : 85 0d __ STA P0 
26a1 : e6 45 __ INC T1 + 0 
26a3 : a9 c9 __ LDA #$c9
26a5 : 85 0f __ STA P2 
26a7 : a9 bf __ LDA #$bf
26a9 : 85 10 __ STA P3 
26ab : 20 31 20 JSR $2031 ; (putsxy.s4 + 0)
26ae : e6 15 __ INC P8 
26b0 : a5 15 __ LDA P8 
26b2 : c9 15 __ CMP #$15
26b4 : 90 c5 __ BCC $267b ; (printSectorNumbers.l5 + 0)
.s3:
26b6 : 60 __ __ RTS
--------------------------------------------------------------------
printLegend: ; printLegend()->void
.s4:
26b7 : a9 21 __ LDA #$21
26b9 : 85 0d __ STA P0 
26bb : a9 26 __ LDA #$26
26bd : 85 10 __ STA P3 
26bf : a9 16 __ LDA #$16
26c1 : 85 0e __ STA P1 
26c3 : a9 ec __ LDA #$ec
26c5 : 85 0f __ STA P2 
26c7 : 20 31 20 JSR $2031 ; (putsxy.s4 + 0)
26ca : e6 0e __ INC P1 
26cc : a9 1c __ LDA #$1c
26ce : 85 0d __ STA P0 
26d0 : a9 00 __ LDA #$00
26d2 : 85 0f __ STA P2 
26d4 : a9 27 __ LDA #$27
26d6 : 85 10 __ STA P3 
26d8 : 20 31 20 JSR $2031 ; (putsxy.s4 + 0)
26db : e6 0e __ INC P1 
26dd : a9 1a __ LDA #$1a
26df : 85 0d __ STA P0 
26e1 : a9 0d __ LDA #$0d
26e3 : 85 0f __ STA P2 
26e5 : a9 27 __ LDA #$27
26e7 : 85 10 __ STA P3 
26e9 : 4c 31 20 JMP $2031 ; (putsxy.s4 + 0)
--------------------------------------------------------------------
26ec : __ __ __ BYT 21 3d 45 52 52 4f 52 00                         : !=ERROR.
--------------------------------------------------------------------
krnio_setbnk: ; krnio_setbnk(u8,u8)->void
.s4:
26f4 : a5 0d __ LDA P0 
26f6 : a6 0e __ LDX P1 
26f8 : 20 68 ff JSR $ff68 
.s3:
26fb : 60 __ __ RTS
--------------------------------------------------------------------
26fc : __ __ __ BYT 52 00                                           : R.
--------------------------------------------------------------------
26fe : __ __ __ BYT 23 00                                           : #.
--------------------------------------------------------------------
2700 : __ __ __ BYT 4f 3d 53 4b 49 50 2c 20 2e 3d 4f 4b 00          : O=SKIP, .=OK.
--------------------------------------------------------------------
270d : __ __ __ BYT 52 3d 52 45 41 44 2c 57 3d 57 52 49 54 45 00    : R=READ,W=WRITE.
--------------------------------------------------------------------
271c : __ __ __ BYT 50 52 45 53 53 20 41 4e 44 20 48 4f 4c 44 20 d3 : PRESS AND HOLD .
272c : __ __ __ BYT 20 54 4f 20 53 54 4f 50 00                      :  TO STOP.
--------------------------------------------------------------------
copyDisk: ; copyDisk(u8,u8,bool)->i16
.s4:
2735 : 20 f0 1f JSR $1ff0 ; (setColorInfo.s4 + 0)
2738 : 20 58 28 JSR $2858 ; (resetCiaTimer.s4 + 0)
273b : ad fd bf LDA $bffd ; (sstack + 7)
273e : 85 4d __ STA T4 + 0 
2740 : 85 10 __ STA P3 
2742 : ad fe bf LDA $bffe ; (sstack + 8)
2745 : 85 4e __ STA T5 + 0 
2747 : 85 11 __ STA P4 
2749 : 20 8e 28 JSR $288e ; (openCommandCannels.s4 + 0)
274c : 24 1c __ BIT ACCU + 1 
274e : 30 0a __ BMI $275a ; (copyDisk.s20 + 0)
.s5:
2750 : 20 da 28 JSR $28da ; (changeBusSpeed.s4 + 0)
2753 : 24 1c __ BIT ACCU + 1 
2755 : 10 0a __ BPL $2761 ; (copyDisk.s6 + 0)
.s19:
2757 : 20 b8 2b JSR $2bb8 ; (closeCommandChannels.s4 + 0)
.s20:
275a : a9 ff __ LDA #$ff
.s3:
275c : 85 1b __ STA ACCU + 0 
275e : 85 1c __ STA ACCU + 1 
2760 : 60 __ __ RTS
.s6:
2761 : a9 01 __ LDA #$01
2763 : 85 4f __ STA T6 + 0 
.l7:
2765 : a9 00 __ LDA #$00
2767 : 85 50 __ STA T7 + 0 
2769 : f0 04 __ BEQ $276f ; (copyDisk.l8 + 0)
.s15:
276b : e6 50 __ INC T7 + 0 
276d : a5 50 __ LDA T7 + 0 
.l8:
276f : a6 4f __ LDX T6 + 0 
2771 : dd aa 30 CMP $30aa,x 
2774 : 90 19 __ BCC $278f ; (copyDisk.s11 + 0)
.s9:
2776 : e6 4f __ INC T6 + 0 
2778 : a5 4f __ LDA T6 + 0 
277a : c9 24 __ CMP #$24
277c : 90 e7 __ BCC $2765 ; (copyDisk.l7 + 0)
.s10:
277e : 20 b8 2b JSR $2bb8 ; (closeCommandChannels.s4 + 0)
2781 : a9 03 __ LDA #$03
2783 : 85 13 __ STA P6 
2785 : 20 47 2c JSR $2c47 ; (stopCiaTimer.s4 + 0)
2788 : 20 c2 2b JSR $2bc2 ; (printTimer.s4 + 0)
278b : a9 00 __ LDA #$00
278d : f0 cd __ BEQ $275c ; (copyDisk.s3 + 0)
.s11:
278f : a9 00 __ LDA #$00
2791 : 85 13 __ STA P6 
2793 : 20 c2 2b JSR $2bc2 ; (printTimer.s4 + 0)
2796 : 20 3d 2c JSR $2c3d ; (getchx.s4 + 0)
2799 : c9 53 __ CMP #$53
279b : f0 6a __ BEQ $2807 ; (copyDisk.s16 + 0)
.s12:
279d : a6 4f __ LDX T6 + 0 
279f : e8 __ __ INX
27a0 : e8 __ __ INX
27a1 : 86 4b __ STX T1 + 0 
27a3 : 86 0d __ STX P0 
27a5 : 18 __ __ CLC
27a6 : a5 50 __ LDA T7 + 0 
27a8 : 69 04 __ ADC #$04
27aa : 85 4c __ STA T2 + 0 
27ac : 85 0e __ STA P1 
27ae : 20 58 2c JSR $2c58 ; (setAccentXY.s4 + 0)
27b1 : a9 fc __ LDA #$fc
27b3 : 85 0f __ STA P2 
27b5 : a9 26 __ LDA #$26
27b7 : 85 10 __ STA P3 
27b9 : 20 31 20 JSR $2031 ; (putsxy.s4 + 0)
27bc : a5 4d __ LDA T4 + 0 
27be : 8d f8 bf STA $bff8 ; (sstack + 2)
27c1 : a5 4f __ LDA T6 + 0 
27c3 : 8d f9 bf STA $bff9 ; (sstack + 3)
27c6 : a5 50 __ LDA T7 + 0 
27c8 : 8d fa bf STA $bffa ; (sstack + 4)
27cb : a9 79 __ LDA #$79
27cd : 8d fb bf STA $bffb ; (sstack + 5)
27d0 : a9 bf __ LDA #$bf
27d2 : 8d fc bf STA $bffc ; (sstack + 6)
27d5 : 20 81 2c JSR $2c81 ; (readSector.s4 + 0)
27d8 : a9 00 __ LDA #$00
27da : 85 13 __ STA P6 
27dc : 20 c2 2b JSR $2bc2 ; (printTimer.s4 + 0)
27df : ad ff bf LDA $bfff ; (sstack + 9)
27e2 : f0 1c __ BEQ $2800 ; (copyDisk.s13 + 0)
.s17:
27e4 : 20 d9 2d JSR $2dd9 ; (checkBufferEmpty.s4 + 0)
27e7 : aa __ __ TAX
27e8 : f0 16 __ BEQ $2800 ; (copyDisk.s13 + 0)
.s18:
27ea : a5 4b __ LDA T1 + 0 
27ec : 85 0d __ STA P0 
27ee : a5 4c __ LDA T2 + 0 
27f0 : 85 0e __ STA P1 
27f2 : a9 f3 __ LDA #$f3
27f4 : 85 0f __ STA P2 
27f6 : a9 2d __ LDA #$2d
27f8 : 85 10 __ STA P3 
27fa : 20 31 20 JSR $2031 ; (putsxy.s4 + 0)
27fd : 4c 6b 27 JMP $276b ; (copyDisk.s15 + 0)
.s13:
2800 : 20 3d 2c JSR $2c3d ; (getchx.s4 + 0)
2803 : c9 53 __ CMP #$53
2805 : d0 09 __ BNE $2810 ; (copyDisk.s14 + 0)
.s16:
2807 : 20 b8 2b JSR $2bb8 ; (closeCommandChannels.s4 + 0)
280a : 20 47 2c JSR $2c47 ; (stopCiaTimer.s4 + 0)
280d : 4c 5a 27 JMP $275a ; (copyDisk.s20 + 0)
.s14:
2810 : a5 4b __ LDA T1 + 0 
2812 : 85 0d __ STA P0 
2814 : a5 4c __ LDA T2 + 0 
2816 : 85 0e __ STA P1 
2818 : a9 f5 __ LDA #$f5
281a : 85 0f __ STA P2 
281c : a9 2d __ LDA #$2d
281e : 85 10 __ STA P3 
2820 : 20 31 20 JSR $2031 ; (putsxy.s4 + 0)
2823 : a5 4e __ LDA T5 + 0 
2825 : 8d f8 bf STA $bff8 ; (sstack + 2)
2828 : a5 4f __ LDA T6 + 0 
282a : 8d f9 bf STA $bff9 ; (sstack + 3)
282d : a5 50 __ LDA T7 + 0 
282f : 8d fa bf STA $bffa ; (sstack + 4)
2832 : a9 79 __ LDA #$79
2834 : 8d fb bf STA $bffb ; (sstack + 5)
2837 : a9 bf __ LDA #$bf
2839 : 8d fc bf STA $bffc ; (sstack + 6)
283c : 20 f7 2d JSR $2df7 ; (writeSector.s4 + 0)
283f : a5 4b __ LDA T1 + 0 
2841 : 85 0d __ STA P0 
2843 : a5 4c __ LDA T2 + 0 
2845 : 85 0e __ STA P1 
2847 : a9 fc __ LDA #$fc
2849 : 85 0f __ STA P2 
284b : a9 2e __ LDA #$2e
284d : 85 10 __ STA P3 
284f : 20 31 20 JSR $2031 ; (putsxy.s4 + 0)
2852 : 20 57 2f JSR $2f57 ; (setNormalXY.s4 + 0)
2855 : 4c 6b 27 JMP $276b ; (copyDisk.s15 + 0)
--------------------------------------------------------------------
resetCiaTimer: ; resetCiaTimer()->void
.s4:
2858 : ad 9d 30 LDA $309d ; (CIA1_TODH + 0)
285b : 85 1b __ STA ACCU + 0 
285d : ad 9e 30 LDA $309e ; (CIA1_TODH + 1)
2860 : 85 1c __ STA ACCU + 1 
2862 : a9 0c __ LDA #$0c
2864 : a0 00 __ LDY #$00
2866 : 91 1b __ STA (ACCU + 0),y 
2868 : ad 9f 30 LDA $309f ; (CIA1_TODM + 0)
286b : 85 1b __ STA ACCU + 0 
286d : ad a0 30 LDA $30a0 ; (CIA1_TODM + 1)
2870 : 85 1c __ STA ACCU + 1 
2872 : 98 __ __ TYA
2873 : 91 1b __ STA (ACCU + 0),y 
2875 : ae a1 30 LDX $30a1 ; (CIA1_TODS + 0)
2878 : 86 1b __ STX ACCU + 0 
287a : ae a2 30 LDX $30a2 ; (CIA1_TODS + 1)
287d : 86 1c __ STX ACCU + 1 
287f : 91 1b __ STA (ACCU + 0),y 
2881 : ae a3 30 LDX $30a3 ; (CIA1_TODT + 0)
2884 : 86 1b __ STX ACCU + 0 
2886 : ae a4 30 LDX $30a4 ; (CIA1_TODT + 1)
2889 : 86 1c __ STX ACCU + 1 
288b : 91 1b __ STA (ACCU + 0),y 
.s3:
288d : 60 __ __ RTS
--------------------------------------------------------------------
openCommandCannels: ; openCommandCannels(u8,u8)->i16
.s4:
288e : a9 a7 __ LDA #$a7
2890 : 85 0d __ STA P0 
2892 : a9 23 __ LDA #$23
2894 : 85 0e __ STA P1 
2896 : 20 91 23 JSR $2391 ; (krnio_setnam.s4 + 0)
2899 : a9 0f __ LDA #$0f
289b : 85 0d __ STA P0 
289d : 85 0f __ STA P2 
289f : a5 10 __ LDA P3 ; (src_drive + 0)
28a1 : 85 0e __ STA P1 
28a3 : 20 a8 23 JSR $23a8 ; (krnio_open.s4 + 0)
28a6 : aa __ __ TAX
28a7 : f0 2a __ BEQ $28d3 ; (openCommandCannels.s5 + 0)
.s6:
28a9 : a9 a7 __ LDA #$a7
28ab : 85 0d __ STA P0 
28ad : a9 23 __ LDA #$23
28af : 85 0e __ STA P1 
28b1 : 20 91 23 JSR $2391 ; (krnio_setnam.s4 + 0)
28b4 : a5 11 __ LDA P4 ; (dest_drive + 0)
28b6 : 85 0e __ STA P1 
28b8 : a9 10 __ LDA #$10
28ba : 85 0d __ STA P0 
28bc : a9 0f __ LDA #$0f
28be : 85 0f __ STA P2 
28c0 : 20 a8 23 JSR $23a8 ; (krnio_open.s4 + 0)
28c3 : aa __ __ TAX
28c4 : f0 0d __ BEQ $28d3 ; (openCommandCannels.s5 + 0)
.s7:
28c6 : a9 00 __ LDA #$00
28c8 : 85 0d __ STA P0 
28ca : 85 0e __ STA P1 
28cc : 20 f4 26 JSR $26f4 ; (krnio_setbnk.s4 + 0)
28cf : a9 00 __ LDA #$00
28d1 : f0 02 __ BEQ $28d5 ; (openCommandCannels.s3 + 0)
.s5:
28d3 : a9 ff __ LDA #$ff
.s3:
28d5 : 85 1b __ STA ACCU + 0 
28d7 : 85 1c __ STA ACCU + 1 
28d9 : 60 __ __ RTS
--------------------------------------------------------------------
changeBusSpeed: ; changeBusSpeed()->i16
.s4:
28da : a9 4d __ LDA #$4d
28dc : 8d 9a bf STA $bf9a ; (cmd2 + 0)
28df : 8d a0 bf STA $bfa0 ; (cmd + 0)
28e2 : a9 2d __ LDA #$2d
28e4 : 8d 9b bf STA $bf9b ; (cmd2 + 1)
28e7 : 8d a1 bf STA $bfa1 ; (cmd + 1)
28ea : a9 06 __ LDA #$06
28ec : 85 11 __ STA P4 
28ee : 8d 9d bf STA $bf9d ; (cmd2 + 3)
28f1 : 8d a3 bf STA $bfa3 ; (cmd + 3)
28f4 : a9 52 __ LDA #$52
28f6 : 8d 9c bf STA $bf9c ; (cmd2 + 2)
28f9 : a9 18 __ LDA #$18
28fb : 8d 9e bf STA $bf9e ; (cmd2 + 4)
28fe : 8d a4 bf STA $bfa4 ; (cmd + 4)
2901 : a9 02 __ LDA #$02
2903 : 8d 9f bf STA $bf9f ; (cmd2 + 5)
2906 : 8d a5 bf STA $bfa5 ; (cmd + 5)
2909 : a9 57 __ LDA #$57
290b : 8d a2 bf STA $bfa2 ; (cmd + 2)
290e : a9 aa __ LDA #$aa
2910 : 8d a6 bf STA $bfa6 ; (cmd + 6)
2913 : a9 01 __ LDA #$01
2915 : 8d a7 bf STA $bfa7 ; (cmd + 7)
2918 : a9 0f __ LDA #$0f
291a : 85 0e __ STA P1 
291c : a9 bf __ LDA #$bf
291e : 85 10 __ STA P3 
2920 : a9 00 __ LDA #$00
2922 : 85 12 __ STA P5 
2924 : a9 9a __ LDA #$9a
2926 : 85 0f __ STA P2 
2928 : 20 6a 2b JSR $2b6a ; (krnio_write.s4 + 0)
292b : a5 1c __ LDA ACCU + 1 
292d : 10 03 __ BPL $2932 ; (changeBusSpeed.s28 + 0)
292f : 4c 59 2b JMP $2b59 ; (changeBusSpeed.s16 + 0)
.s28:
2932 : 05 1b __ ORA ACCU + 0 
2934 : f0 f9 __ BEQ $292f ; (changeBusSpeed.s4 + 85)
.s5:
2936 : a9 0f __ LDA #$0f
2938 : 85 0e __ STA P1 
293a : a9 bf __ LDA #$bf
293c : 85 10 __ STA P3 
293e : a9 02 __ LDA #$02
2940 : 85 11 __ STA P4 
2942 : a9 ca __ LDA #$ca
2944 : 85 0f __ STA P2 
2946 : 20 4b 24 JSR $244b ; (krnio_read.s4 + 0)
2949 : a5 1c __ LDA ACCU + 1 
294b : 30 e2 __ BMI $292f ; (changeBusSpeed.s4 + 85)
.s27:
294d : 05 1b __ ORA ACCU + 0 
294f : f0 de __ BEQ $292f ; (changeBusSpeed.s4 + 85)
.s6:
2951 : a9 a8 __ LDA #$a8
2953 : 85 0d __ STA P0 
2955 : a9 23 __ LDA #$23
2957 : 85 10 __ STA P3 
2959 : a9 bf __ LDA #$bf
295b : 85 0e __ STA P1 
295d : a9 a7 __ LDA #$a7
295f : 85 0f __ STA P2 
2961 : 20 a3 21 JSR $21a3 ; (set_sstr.s4 + 0)
2964 : ad cb bf LDA $bfcb ; (buf + 1)
2967 : 85 16 __ STA P9 
2969 : a9 a8 __ LDA #$a8
296b : 85 13 __ STA P6 
296d : a9 bf __ LDA #$bf
296f : 85 14 __ STA P7 
2971 : ad ca bf LDA $bfca ; (buf + 0)
2974 : 85 15 __ STA P8 
2976 : 20 c6 21 JSR $21c6 ; (append_sstr_num.s4 + 0)
2979 : a9 00 __ LDA #$00
297b : 85 0d __ STA P0 
297d : 85 0e __ STA P1 
297f : a9 a9 __ LDA #$a9
2981 : 85 0f __ STA P2 
2983 : a9 bf __ LDA #$bf
2985 : 85 10 __ STA P3 
2987 : 20 31 20 JSR $2031 ; (putsxy.s4 + 0)
298a : a9 0f __ LDA #$0f
298c : 85 0e __ STA P1 
298e : a9 bf __ LDA #$bf
2990 : 85 10 __ STA P3 
2992 : a9 08 __ LDA #$08
2994 : 85 11 __ STA P4 
2996 : a9 00 __ LDA #$00
2998 : 85 12 __ STA P5 
299a : a9 a0 __ LDA #$a0
299c : 85 0f __ STA P2 
299e : 20 6a 2b JSR $2b6a ; (krnio_write.s4 + 0)
29a1 : a5 1c __ LDA ACCU + 1 
29a3 : 30 8a __ BMI $292f ; (changeBusSpeed.s4 + 85)
.s26:
29a5 : 05 1b __ ORA ACCU + 0 
29a7 : f0 86 __ BEQ $292f ; (changeBusSpeed.s4 + 85)
.s7:
29a9 : a9 0f __ LDA #$0f
29ab : 85 0e __ STA P1 
29ad : a9 06 __ LDA #$06
29af : 85 11 __ STA P4 
29b1 : a9 9a __ LDA #$9a
29b3 : 85 0f __ STA P2 
29b5 : a9 bf __ LDA #$bf
29b7 : 85 10 __ STA P3 
29b9 : 20 6a 2b JSR $2b6a ; (krnio_write.s4 + 0)
29bc : a5 1c __ LDA ACCU + 1 
29be : 10 03 __ BPL $29c3 ; (changeBusSpeed.s25 + 0)
29c0 : 4c 59 2b JMP $2b59 ; (changeBusSpeed.s16 + 0)
.s25:
29c3 : 05 1b __ ORA ACCU + 0 
29c5 : f0 f9 __ BEQ $29c0 ; (changeBusSpeed.s7 + 23)
.s8:
29c7 : a9 0f __ LDA #$0f
29c9 : 85 0e __ STA P1 
29cb : a9 02 __ LDA #$02
29cd : 85 11 __ STA P4 
29cf : a9 ca __ LDA #$ca
29d1 : 85 0f __ STA P2 
29d3 : a9 bf __ LDA #$bf
29d5 : 85 10 __ STA P3 
29d7 : 20 4b 24 JSR $244b ; (krnio_read.s4 + 0)
29da : a5 1c __ LDA ACCU + 1 
29dc : 30 e2 __ BMI $29c0 ; (changeBusSpeed.s7 + 23)
.s24:
29de : 05 1b __ ORA ACCU + 0 
29e0 : f0 de __ BEQ $29c0 ; (changeBusSpeed.s7 + 23)
.s9:
29e2 : a9 a8 __ LDA #$a8
29e4 : 85 0d __ STA P0 
29e6 : a9 23 __ LDA #$23
29e8 : 85 10 __ STA P3 
29ea : a9 bf __ LDA #$bf
29ec : 85 0e __ STA P1 
29ee : a9 a7 __ LDA #$a7
29f0 : 85 0f __ STA P2 
29f2 : 20 a3 21 JSR $21a3 ; (set_sstr.s4 + 0)
29f5 : ad cb bf LDA $bfcb ; (buf + 1)
29f8 : 85 16 __ STA P9 
29fa : ad ca bf LDA $bfca ; (buf + 0)
29fd : 85 15 __ STA P8 
29ff : 20 c6 21 JSR $21c6 ; (append_sstr_num.s4 + 0)
2a02 : a9 00 __ LDA #$00
2a04 : 85 0d __ STA P0 
2a06 : a9 bf __ LDA #$bf
2a08 : 85 10 __ STA P3 
2a0a : a9 01 __ LDA #$01
2a0c : 85 0e __ STA P1 
2a0e : a9 a9 __ LDA #$a9
2a10 : 85 0f __ STA P2 
2a12 : 20 31 20 JSR $2031 ; (putsxy.s4 + 0)
2a15 : a9 10 __ LDA #$10
2a17 : 85 0e __ STA P1 
2a19 : a9 00 __ LDA #$00
2a1b : 85 12 __ STA P5 
2a1d : a9 a0 __ LDA #$a0
2a1f : 85 0f __ STA P2 
2a21 : a9 bf __ LDA #$bf
2a23 : 85 10 __ STA P3 
2a25 : a9 08 __ LDA #$08
2a27 : 85 11 __ STA P4 
2a29 : 20 6a 2b JSR $2b6a ; (krnio_write.s4 + 0)
2a2c : a5 1c __ LDA ACCU + 1 
2a2e : 30 90 __ BMI $29c0 ; (changeBusSpeed.s7 + 23)
.s23:
2a30 : 05 1b __ ORA ACCU + 0 
2a32 : f0 8c __ BEQ $29c0 ; (changeBusSpeed.s7 + 23)
.s10:
2a34 : a9 06 __ LDA #$06
2a36 : 85 11 __ STA P4 
2a38 : 8d 9d bf STA $bf9d ; (cmd2 + 3)
2a3b : 8d a3 bf STA $bfa3 ; (cmd + 3)
2a3e : a9 1c __ LDA #$1c
2a40 : 8d 9e bf STA $bf9e ; (cmd2 + 4)
2a43 : 8d a4 bf STA $bfa4 ; (cmd + 4)
2a46 : a9 0f __ LDA #$0f
2a48 : 8d a7 bf STA $bfa7 ; (cmd + 7)
2a4b : 85 0e __ STA P1 
2a4d : a9 3a __ LDA #$3a
2a4f : 8d a6 bf STA $bfa6 ; (cmd + 6)
2a52 : a9 9a __ LDA #$9a
2a54 : 85 0f __ STA P2 
2a56 : a9 bf __ LDA #$bf
2a58 : 85 10 __ STA P3 
2a5a : 20 6a 2b JSR $2b6a ; (krnio_write.s4 + 0)
2a5d : a5 1c __ LDA ACCU + 1 
2a5f : 10 03 __ BPL $2a64 ; (changeBusSpeed.s22 + 0)
2a61 : 4c 59 2b JMP $2b59 ; (changeBusSpeed.s16 + 0)
.s22:
2a64 : 05 1b __ ORA ACCU + 0 
2a66 : f0 f9 __ BEQ $2a61 ; (changeBusSpeed.s10 + 45)
.s11:
2a68 : a9 0f __ LDA #$0f
2a6a : 85 0e __ STA P1 
2a6c : a9 02 __ LDA #$02
2a6e : 85 11 __ STA P4 
2a70 : a9 ca __ LDA #$ca
2a72 : 85 0f __ STA P2 
2a74 : a9 bf __ LDA #$bf
2a76 : 85 10 __ STA P3 
2a78 : 20 4b 24 JSR $244b ; (krnio_read.s4 + 0)
2a7b : a5 1c __ LDA ACCU + 1 
2a7d : 30 e2 __ BMI $2a61 ; (changeBusSpeed.s10 + 45)
.s21:
2a7f : 05 1b __ ORA ACCU + 0 
2a81 : f0 de __ BEQ $2a61 ; (changeBusSpeed.s10 + 45)
.s12:
2a83 : a9 a8 __ LDA #$a8
2a85 : 85 0d __ STA P0 
2a87 : a9 23 __ LDA #$23
2a89 : 85 10 __ STA P3 
2a8b : a9 bf __ LDA #$bf
2a8d : 85 0e __ STA P1 
2a8f : a9 a7 __ LDA #$a7
2a91 : 85 0f __ STA P2 
2a93 : 20 a3 21 JSR $21a3 ; (set_sstr.s4 + 0)
2a96 : ad cb bf LDA $bfcb ; (buf + 1)
2a99 : 85 16 __ STA P9 
2a9b : ad ca bf LDA $bfca ; (buf + 0)
2a9e : 85 15 __ STA P8 
2aa0 : 20 c6 21 JSR $21c6 ; (append_sstr_num.s4 + 0)
2aa3 : a9 00 __ LDA #$00
2aa5 : 85 0d __ STA P0 
2aa7 : a9 bf __ LDA #$bf
2aa9 : 85 10 __ STA P3 
2aab : a9 02 __ LDA #$02
2aad : 85 0e __ STA P1 
2aaf : a9 a9 __ LDA #$a9
2ab1 : 85 0f __ STA P2 
2ab3 : 20 31 20 JSR $2031 ; (putsxy.s4 + 0)
2ab6 : a9 0f __ LDA #$0f
2ab8 : 85 0e __ STA P1 
2aba : a9 00 __ LDA #$00
2abc : 85 12 __ STA P5 
2abe : a9 a0 __ LDA #$a0
2ac0 : 85 0f __ STA P2 
2ac2 : a9 bf __ LDA #$bf
2ac4 : 85 10 __ STA P3 
2ac6 : a9 08 __ LDA #$08
2ac8 : 85 11 __ STA P4 
2aca : 20 6a 2b JSR $2b6a ; (krnio_write.s4 + 0)
2acd : a5 1c __ LDA ACCU + 1 
2acf : 30 90 __ BMI $2a61 ; (changeBusSpeed.s10 + 45)
.s20:
2ad1 : 05 1b __ ORA ACCU + 0 
2ad3 : f0 8c __ BEQ $2a61 ; (changeBusSpeed.s10 + 45)
.s13:
2ad5 : a9 0f __ LDA #$0f
2ad7 : 85 0e __ STA P1 
2ad9 : a9 06 __ LDA #$06
2adb : 85 11 __ STA P4 
2add : a9 9a __ LDA #$9a
2adf : 85 0f __ STA P2 
2ae1 : a9 bf __ LDA #$bf
2ae3 : 85 10 __ STA P3 
2ae5 : 20 6a 2b JSR $2b6a ; (krnio_write.s4 + 0)
2ae8 : a5 1c __ LDA ACCU + 1 
2aea : 30 6d __ BMI $2b59 ; (changeBusSpeed.s16 + 0)
.s19:
2aec : 05 1b __ ORA ACCU + 0 
2aee : f0 69 __ BEQ $2b59 ; (changeBusSpeed.s16 + 0)
.s14:
2af0 : a9 0f __ LDA #$0f
2af2 : 85 0e __ STA P1 
2af4 : a9 02 __ LDA #$02
2af6 : 85 11 __ STA P4 
2af8 : a9 ca __ LDA #$ca
2afa : 85 0f __ STA P2 
2afc : a9 bf __ LDA #$bf
2afe : 85 10 __ STA P3 
2b00 : 20 4b 24 JSR $244b ; (krnio_read.s4 + 0)
2b03 : a5 1c __ LDA ACCU + 1 
2b05 : 30 52 __ BMI $2b59 ; (changeBusSpeed.s16 + 0)
.s18:
2b07 : 05 1b __ ORA ACCU + 0 
2b09 : f0 4e __ BEQ $2b59 ; (changeBusSpeed.s16 + 0)
.s15:
2b0b : a9 a8 __ LDA #$a8
2b0d : 85 0d __ STA P0 
2b0f : a9 23 __ LDA #$23
2b11 : 85 10 __ STA P3 
2b13 : a9 bf __ LDA #$bf
2b15 : 85 0e __ STA P1 
2b17 : a9 a7 __ LDA #$a7
2b19 : 85 0f __ STA P2 
2b1b : 20 a3 21 JSR $21a3 ; (set_sstr.s4 + 0)
2b1e : ad cb bf LDA $bfcb ; (buf + 1)
2b21 : 85 16 __ STA P9 
2b23 : ad ca bf LDA $bfca ; (buf + 0)
2b26 : 85 15 __ STA P8 
2b28 : 20 c6 21 JSR $21c6 ; (append_sstr_num.s4 + 0)
2b2b : a9 00 __ LDA #$00
2b2d : 85 0d __ STA P0 
2b2f : a9 bf __ LDA #$bf
2b31 : 85 10 __ STA P3 
2b33 : a9 03 __ LDA #$03
2b35 : 85 0e __ STA P1 
2b37 : a9 a9 __ LDA #$a9
2b39 : 85 0f __ STA P2 
2b3b : 20 31 20 JSR $2031 ; (putsxy.s4 + 0)
2b3e : a9 10 __ LDA #$10
2b40 : 85 0e __ STA P1 
2b42 : a9 00 __ LDA #$00
2b44 : 85 12 __ STA P5 
2b46 : a9 a0 __ LDA #$a0
2b48 : 85 0f __ STA P2 
2b4a : a9 bf __ LDA #$bf
2b4c : 85 10 __ STA P3 
2b4e : a9 08 __ LDA #$08
2b50 : 85 11 __ STA P4 
2b52 : 20 6a 2b JSR $2b6a ; (krnio_write.s4 + 0)
2b55 : a5 1c __ LDA ACCU + 1 
2b57 : 10 04 __ BPL $2b5d ; (changeBusSpeed.s17 + 0)
.s16:
2b59 : a9 ff __ LDA #$ff
2b5b : d0 08 __ BNE $2b65 ; (changeBusSpeed.s3 + 0)
.s17:
2b5d : 05 1b __ ORA ACCU + 0 
2b5f : c9 01 __ CMP #$01
2b61 : a9 00 __ LDA #$00
2b63 : 69 ff __ ADC #$ff
.s3:
2b65 : 85 1b __ STA ACCU + 0 
2b67 : 85 1c __ STA ACCU + 1 
2b69 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_write: ; krnio_write(u8,const u8*,i16)->i16
.s4:
2b6a : a5 0e __ LDA P1 ; (fnum + 0)
2b6c : 20 17 24 JSR $2417 ; (krnio_chkout.s4 + 0)
2b6f : aa __ __ TAX
2b70 : d0 07 __ BNE $2b79 ; (krnio_write.s6 + 0)
.s5:
2b72 : a9 ff __ LDA #$ff
2b74 : 85 1b __ STA ACCU + 0 
.s3:
2b76 : 85 1c __ STA ACCU + 1 
2b78 : 60 __ __ RTS
.s6:
2b79 : a5 12 __ LDA P5 ; (num + 1)
2b7b : 30 2f __ BMI $2bac ; (krnio_write.s7 + 0)
.s10:
2b7d : 05 11 __ ORA P4 ; (num + 0)
2b7f : f0 2b __ BEQ $2bac ; (krnio_write.s7 + 0)
.s8:
2b81 : a5 11 __ LDA P4 ; (num + 0)
2b83 : 85 43 __ STA T1 + 0 
2b85 : a5 12 __ LDA P5 ; (num + 1)
2b87 : 85 44 __ STA T1 + 1 
2b89 : a5 0f __ LDA P2 ; (data + 0)
2b8b : 85 45 __ STA T2 + 0 
2b8d : a5 10 __ LDA P3 ; (data + 1)
2b8f : 85 46 __ STA T2 + 1 
.l9:
2b91 : a0 00 __ LDY #$00
2b93 : b1 45 __ LDA (T2 + 0),y 
2b95 : 20 2c 24 JSR $242c ; (krnio_chrout.s4 + 0)
2b98 : e6 45 __ INC T2 + 0 
2b9a : d0 02 __ BNE $2b9e ; (krnio_write.s12 + 0)
.s11:
2b9c : e6 46 __ INC T2 + 1 
.s12:
2b9e : a5 43 __ LDA T1 + 0 
2ba0 : d0 02 __ BNE $2ba4 ; (krnio_write.s14 + 0)
.s13:
2ba2 : c6 44 __ DEC T1 + 1 
.s14:
2ba4 : c6 43 __ DEC T1 + 0 
2ba6 : d0 e9 __ BNE $2b91 ; (krnio_write.l9 + 0)
.s15:
2ba8 : a5 44 __ LDA T1 + 1 
2baa : d0 e5 __ BNE $2b91 ; (krnio_write.l9 + 0)
.s7:
2bac : 20 3c 24 JSR $243c ; (krnio_clrchn.s4 + 0)
2baf : a5 11 __ LDA P4 ; (num + 0)
2bb1 : 85 1b __ STA ACCU + 0 
2bb3 : a5 12 __ LDA P5 ; (num + 1)
2bb5 : 4c 76 2b JMP $2b76 ; (krnio_write.s3 + 0)
--------------------------------------------------------------------
closeCommandChannels: ; closeCommandChannels()->void
.s4:
2bb8 : a9 10 __ LDA #$10
2bba : 20 43 24 JSR $2443 ; (krnio_close.s4 + 0)
2bbd : a9 0f __ LDA #$0f
2bbf : 4c 43 24 JMP $2443 ; (krnio_close.s4 + 0)
--------------------------------------------------------------------
printTimer: ; printTimer(u8)->void
.s4:
2bc2 : a9 ce __ LDA #$ce
2bc4 : 85 11 __ STA P4 
2bc6 : a9 bf __ LDA #$bf
2bc8 : 85 12 __ STA P5 
2bca : 20 e0 2b JSR $2be0 ; (getCiaTimer.s4 + 0)
2bcd : a5 13 __ LDA P6 ; (ypos + 0)
2bcf : 85 0e __ STA P1 
2bd1 : a9 23 __ LDA #$23
2bd3 : 85 0d __ STA P0 
2bd5 : a9 cf __ LDA #$cf
2bd7 : 85 0f __ STA P2 
2bd9 : a9 bf __ LDA #$bf
2bdb : 85 10 __ STA P3 
2bdd : 4c 31 20 JMP $2031 ; (putsxy.s4 + 0)
--------------------------------------------------------------------
getCiaTimer: ; getCiaTimer(struct sstr*)->void
.s4:
2be0 : a2 05 __ LDX #$05
.l5:
2be2 : bd a5 30 LDA $30a5,x 
2be5 : 9d f0 bf STA $bff0,x ; (timerStr + 0)
2be8 : ca __ __ DEX
2be9 : 10 f7 __ BPL $2be2 ; (getCiaTimer.l5 + 0)
.s6:
2beb : ad a1 30 LDA $30a1 ; (CIA1_TODS + 0)
2bee : 85 43 __ STA T0 + 0 
2bf0 : ad a2 30 LDA $30a2 ; (CIA1_TODS + 1)
2bf3 : 85 44 __ STA T0 + 1 
2bf5 : a0 00 __ LDY #$00
2bf7 : b1 43 __ LDA (T0 + 0),y 
2bf9 : aa __ __ TAX
2bfa : ad 9f 30 LDA $309f ; (CIA1_TODM + 0)
2bfd : 85 43 __ STA T0 + 0 
2bff : ad a0 30 LDA $30a0 ; (CIA1_TODM + 1)
2c02 : 85 44 __ STA T0 + 1 
2c04 : b1 43 __ LDA (T0 + 0),y 
2c06 : a8 __ __ TAY
2c07 : 4a __ __ LSR
2c08 : 4a __ __ LSR
2c09 : 4a __ __ LSR
2c0a : 4a __ __ LSR
2c0b : 09 30 __ ORA #$30
2c0d : 8d f0 bf STA $bff0 ; (timerStr + 0)
2c10 : 98 __ __ TYA
2c11 : 29 0f __ AND #$0f
2c13 : 09 30 __ ORA #$30
2c15 : 8d f1 bf STA $bff1 ; (timerStr + 1)
2c18 : 8a __ __ TXA
2c19 : 4a __ __ LSR
2c1a : 4a __ __ LSR
2c1b : 4a __ __ LSR
2c1c : 4a __ __ LSR
2c1d : 09 30 __ ORA #$30
2c1f : 8d f3 bf STA $bff3 ; (timerStr + 3)
2c22 : 8a __ __ TXA
2c23 : 29 0f __ AND #$0f
2c25 : 09 30 __ ORA #$30
2c27 : 8d f4 bf STA $bff4 ; (timerStr + 4)
2c2a : a5 11 __ LDA P4 ; (tmpstr + 0)
2c2c : 85 0d __ STA P0 
2c2e : a5 12 __ LDA P5 ; (tmpstr + 1)
2c30 : 85 0e __ STA P1 
2c32 : a9 f0 __ LDA #$f0
2c34 : 85 0f __ STA P2 
2c36 : a9 bf __ LDA #$bf
2c38 : 85 10 __ STA P3 
2c3a : 4c a3 21 JMP $21a3 ; (set_sstr.s4 + 0)
--------------------------------------------------------------------
getchx: ; getchx()->u8
.s4:
2c3d : 20 e4 ff JSR $ffe4 
2c40 : 85 1b __ STA ACCU + 0 
2c42 : a5 1b __ LDA ACCU + 0 
2c44 : 4c df 22 JMP $22df ; (convch.s4 + 0)
--------------------------------------------------------------------
stopCiaTimer: ; stopCiaTimer()->void
.s4:
2c47 : ad 9d 30 LDA $309d ; (CIA1_TODH + 0)
2c4a : 85 1b __ STA ACCU + 0 
2c4c : ad 9e 30 LDA $309e ; (CIA1_TODH + 1)
2c4f : 85 1c __ STA ACCU + 1 
2c51 : a9 0c __ LDA #$0c
2c53 : a0 00 __ LDY #$00
2c55 : 91 1b __ STA (ACCU + 0),y 
.s3:
2c57 : 60 __ __ RTS
--------------------------------------------------------------------
setAccentXY: ; setAccentXY(u8,u8)->void
.s4:
2c58 : a5 0e __ LDA P1 ; (y + 0)
2c5a : 0a __ __ ASL
2c5b : 85 1b __ STA ACCU + 0 
2c5d : a9 00 __ LDA #$00
2c5f : 2a __ __ ROL
2c60 : 06 1b __ ASL ACCU + 0 
2c62 : 2a __ __ ROL
2c63 : aa __ __ TAX
2c64 : a5 1b __ LDA ACCU + 0 
2c66 : 65 0e __ ADC P1 ; (y + 0)
2c68 : 85 1b __ STA ACCU + 0 
2c6a : 8a __ __ TXA
2c6b : 69 00 __ ADC #$00
2c6d : 06 1b __ ASL ACCU + 0 
2c6f : 2a __ __ ROL
2c70 : 06 1b __ ASL ACCU + 0 
2c72 : 2a __ __ ROL
2c73 : 06 1b __ ASL ACCU + 0 
2c75 : 2a __ __ ROL
2c76 : 69 d8 __ ADC #$d8
2c78 : 85 1c __ STA ACCU + 1 
2c7a : a9 03 __ LDA #$03
2c7c : a4 0d __ LDY P0 ; (x + 0)
2c7e : 91 1b __ STA (ACCU + 0),y 
.s3:
2c80 : 60 __ __ RTS
--------------------------------------------------------------------
readSector: ; readSector(u8,u8,u8,struct sstr*)->i16
.s4:
2c81 : a9 05 __ LDA #$05
2c83 : 85 10 __ STA P3 
2c85 : 85 11 __ STA P4 
2c87 : ad f8 bf LDA $bff8 ; (sstack + 2)
2c8a : 85 12 __ STA P5 
2c8c : 20 c2 2c JSR $2cc2 ; (openBufferChannel.s4 + 0)
2c8f : 24 1c __ BIT ACCU + 1 ; (track + 0)
2c91 : 30 24 __ BMI $2cb7 ; (readSector.s8 + 0)
.s5:
2c93 : ad f9 bf LDA $bff9 ; (sstack + 3)
2c96 : 85 17 __ STA P10 
2c98 : ad fa bf LDA $bffa ; (sstack + 4)
2c9b : 85 18 __ STA P11 
2c9d : ad fb bf LDA $bffb ; (sstack + 5)
2ca0 : 8d f6 bf STA $bff6 ; (sstack + 0)
2ca3 : ad fc bf LDA $bffc ; (sstack + 6)
2ca6 : 8d f7 bf STA $bff7 ; (sstack + 1)
2ca9 : 20 e7 2c JSR $2ce7 ; (loadSectorToBuffer.s4 + 0)
2cac : 24 1c __ BIT ACCU + 1 ; (track + 0)
2cae : 30 07 __ BMI $2cb7 ; (readSector.s8 + 0)
.s6:
2cb0 : 20 aa 2d JSR $2daa ; (readBufferToMem.s4 + 0)
2cb3 : 24 1c __ BIT ACCU + 1 ; (track + 0)
2cb5 : 10 04 __ BPL $2cbb ; (readSector.s7 + 0)
.s8:
2cb7 : a9 ff __ LDA #$ff
2cb9 : d0 02 __ BNE $2cbd ; (readSector.s3 + 0)
.s7:
2cbb : a9 00 __ LDA #$00
.s3:
2cbd : 85 1b __ STA ACCU + 0 ; (driveid + 0)
2cbf : 85 1c __ STA ACCU + 1 ; (track + 0)
2cc1 : 60 __ __ RTS
--------------------------------------------------------------------
openBufferChannel: ; openBufferChannel(u8,u8,u8)->i16
.s4:
2cc2 : a9 fe __ LDA #$fe
2cc4 : 85 0d __ STA P0 
2cc6 : a9 26 __ LDA #$26
2cc8 : 85 0e __ STA P1 
2cca : 20 91 23 JSR $2391 ; (krnio_setnam.s4 + 0)
2ccd : a5 10 __ LDA P3 ; (file_handle_buff + 0)
2ccf : 85 0d __ STA P0 
2cd1 : a5 12 __ LDA P5 ; (driveid + 0)
2cd3 : 85 0e __ STA P1 
2cd5 : a5 11 __ LDA P4 ; (ch_num + 0)
2cd7 : 85 0f __ STA P2 
2cd9 : 20 a8 23 JSR $23a8 ; (krnio_open.s4 + 0)
2cdc : c9 01 __ CMP #$01
2cde : a9 00 __ LDA #$00
2ce0 : 69 ff __ ADC #$ff
.s3:
2ce2 : 85 1b __ STA ACCU + 0 
2ce4 : 85 1c __ STA ACCU + 1 
2ce6 : 60 __ __ RTS
--------------------------------------------------------------------
loadSectorToBuffer: ; loadSectorToBuffer(u8,u8,struct sstr*)->i16
.s4:
2ce7 : a9 c8 __ LDA #$c8
2ce9 : 85 0d __ STA P0 
2ceb : a9 2d __ LDA #$2d
2ced : 85 10 __ STA P3 
2cef : a9 bf __ LDA #$bf
2cf1 : 85 0e __ STA P1 
2cf3 : a9 57 __ LDA #$57
2cf5 : 85 0f __ STA P2 
2cf7 : 20 a3 21 JSR $21a3 ; (set_sstr.s4 + 0)
2cfa : a5 17 __ LDA P10 ; (track + 0)
2cfc : 85 15 __ STA P8 
2cfe : a9 c8 __ LDA #$c8
2d00 : 85 13 __ STA P6 
2d02 : a9 bf __ LDA #$bf
2d04 : 85 14 __ STA P7 
2d06 : a9 00 __ LDA #$00
2d08 : 85 16 __ STA P9 
2d0a : 20 c6 21 JSR $21c6 ; (append_sstr_num.s4 + 0)
2d0d : a9 c8 __ LDA #$c8
2d0f : 85 0d __ STA P0 
2d11 : a9 2d __ LDA #$2d
2d13 : 85 10 __ STA P3 
2d15 : a9 bf __ LDA #$bf
2d17 : 85 0e __ STA P1 
2d19 : a9 5f __ LDA #$5f
2d1b : 85 0f __ STA P2 
2d1d : 20 95 22 JSR $2295 ; (append_sstr.s4 + 0)
2d20 : a5 18 __ LDA P11 ; (sec + 0)
2d22 : 85 15 __ STA P8 
2d24 : 20 c6 21 JSR $21c6 ; (append_sstr_num.s4 + 0)
2d27 : a9 0f __ LDA #$0f
2d29 : 85 0e __ STA P1 
2d2b : a9 bf __ LDA #$bf
2d2d : 85 10 __ STA P3 
2d2f : a9 c9 __ LDA #$c9
2d31 : 85 0f __ STA P2 
2d33 : 20 d6 23 JSR $23d6 ; (krnio_puts.s4 + 0)
2d36 : a5 1c __ LDA ACCU + 1 
2d38 : 30 11 __ BMI $2d4b ; (loadSectorToBuffer.s6 + 0)
.s7:
2d3a : 05 1b __ ORA ACCU + 0 
2d3c : f0 0d __ BEQ $2d4b ; (loadSectorToBuffer.s6 + 0)
.s5:
2d3e : ad f6 bf LDA $bff6 ; (sstack + 0)
2d41 : 85 13 __ STA P6 
2d43 : ad f7 bf LDA $bff7 ; (sstack + 1)
2d46 : 85 14 __ STA P7 
2d48 : 4c 61 2d JMP $2d61 ; (waitForReadStatus.s4 + 0)
.s6:
2d4b : a9 05 __ LDA #$05
2d4d : 20 43 24 JSR $2443 ; (krnio_close.s4 + 0)
2d50 : a9 ff __ LDA #$ff
2d52 : 85 1b __ STA ACCU + 0 
2d54 : 85 1c __ STA ACCU + 1 
.s3:
2d56 : 60 __ __ RTS
--------------------------------------------------------------------
2d57 : __ __ __ BYT 55 31 20 35 20 30 20 00                         : U1 5 0 .
--------------------------------------------------------------------
2d5f : __ __ __ BYT 20 00                                           :  .
--------------------------------------------------------------------
waitForReadStatus: ; waitForReadStatus(struct sstr*)->i16
.s4:
2d61 : a9 0f __ LDA #$0f
2d63 : 85 0e __ STA P1 
2d65 : a9 10 __ LDA #$10
2d67 : 85 11 __ STA P4 
2d69 : a9 00 __ LDA #$00
2d6b : 85 12 __ STA P5 
2d6d : 18 __ __ CLC
2d6e : a5 13 __ LDA P6 ; (status_str + 0)
2d70 : 69 01 __ ADC #$01
2d72 : 85 0f __ STA P2 
2d74 : a5 14 __ LDA P7 ; (status_str + 1)
2d76 : 69 00 __ ADC #$00
2d78 : 85 10 __ STA P3 
2d7a : 20 4b 24 JSR $244b ; (krnio_read.s4 + 0)
2d7d : a9 00 __ LDA #$00
2d7f : a0 10 __ LDY #$10
2d81 : 91 13 __ STA (P6),y ; (status_str + 0)
2d83 : a5 0f __ LDA P2 
2d85 : 85 0d __ STA P0 
2d87 : a5 10 __ LDA P3 
2d89 : 85 0e __ STA P1 
2d8b : 20 ea 24 JSR $24ea ; (atoi.l4 + 0)
2d8e : a5 1c __ LDA ACCU + 1 
2d90 : 30 08 __ BMI $2d9a ; (waitForReadStatus.s5 + 0)
.s8:
2d92 : d0 0a __ BNE $2d9e ; (waitForReadStatus.s6 + 0)
.s7:
2d94 : a5 1b __ LDA ACCU + 0 
2d96 : c9 14 __ CMP #$14
2d98 : b0 04 __ BCS $2d9e ; (waitForReadStatus.s6 + 0)
.s5:
2d9a : a9 00 __ LDA #$00
2d9c : f0 07 __ BEQ $2da5 ; (waitForReadStatus.s3 + 0)
.s6:
2d9e : a9 05 __ LDA #$05
2da0 : 20 43 24 JSR $2443 ; (krnio_close.s4 + 0)
2da3 : a9 ff __ LDA #$ff
.s3:
2da5 : 85 1b __ STA ACCU + 0 
2da7 : 85 1c __ STA ACCU + 1 
2da9 : 60 __ __ RTS
--------------------------------------------------------------------
readBufferToMem: ; readBufferToMem()->i16
.s4:
2daa : a9 05 __ LDA #$05
2dac : 85 0e __ STA P1 
2dae : a9 31 __ LDA #$31
2db0 : 85 10 __ STA P3 
2db2 : a9 00 __ LDA #$00
2db4 : 85 11 __ STA P4 
2db6 : a9 01 __ LDA #$01
2db8 : 85 12 __ STA P5 
2dba : a9 00 __ LDA #$00
2dbc : 85 0f __ STA P2 
2dbe : 20 4b 24 JSR $244b ; (krnio_read.s4 + 0)
2dc1 : a5 1c __ LDA ACCU + 1 
2dc3 : 85 48 __ STA T0 + 1 
2dc5 : a9 05 __ LDA #$05
2dc7 : 20 43 24 JSR $2443 ; (krnio_close.s4 + 0)
2dca : 24 48 __ BIT T0 + 1 
2dcc : 10 04 __ BPL $2dd2 ; (readBufferToMem.s5 + 0)
.s6:
2dce : a9 ff __ LDA #$ff
2dd0 : d0 02 __ BNE $2dd4 ; (readBufferToMem.s3 + 0)
.s5:
2dd2 : a9 00 __ LDA #$00
.s3:
2dd4 : 85 1b __ STA ACCU + 0 
2dd6 : 85 1c __ STA ACCU + 1 
2dd8 : 60 __ __ RTS
--------------------------------------------------------------------
checkBufferEmpty: ; checkBufferEmpty()->bool
.s4:
2dd9 : ad 00 31 LDA $3100 ; (buffer + 0)
2ddc : d0 0f __ BNE $2ded ; (checkBufferEmpty.s9 + 0)
.s5:
2dde : a0 01 __ LDY #$01
2de0 : ad 01 31 LDA $3101 ; (buffer + 1)
2de3 : d0 08 __ BNE $2ded ; (checkBufferEmpty.s9 + 0)
.l6:
2de5 : c8 __ __ INY
2de6 : f0 08 __ BEQ $2df0 ; (checkBufferEmpty.s7 + 0)
.s8:
2de8 : b9 00 31 LDA $3100,y ; (buffer + 0)
2deb : f0 f8 __ BEQ $2de5 ; (checkBufferEmpty.l6 + 0)
.s9:
2ded : a9 00 __ LDA #$00
.s3:
2def : 60 __ __ RTS
.s7:
2df0 : a9 01 __ LDA #$01
2df2 : 60 __ __ RTS
--------------------------------------------------------------------
2df3 : __ __ __ BYT 4f 00                                           : O.
--------------------------------------------------------------------
2df5 : __ __ __ BYT 57 00                                           : W.
--------------------------------------------------------------------
writeSector: ; writeSector(u8,u8,u8,struct sstr*)->i16
.s4:
2df7 : ad f8 bf LDA $bff8 ; (sstack + 2)
2dfa : 85 12 __ STA P5 
2dfc : a9 09 __ LDA #$09
2dfe : 85 10 __ STA P3 
2e00 : a9 06 __ LDA #$06
2e02 : 85 11 __ STA P4 
2e04 : 20 c2 2c JSR $2cc2 ; (openBufferChannel.s4 + 0)
2e07 : 24 1c __ BIT ACCU + 1 ; (track + 0)
2e09 : 30 24 __ BMI $2e2f ; (writeSector.s8 + 0)
.s5:
2e0b : 20 3a 2e JSR $2e3a ; (writeMemToBuffer.s4 + 0)
2e0e : 24 1c __ BIT ACCU + 1 ; (track + 0)
2e10 : 30 1d __ BMI $2e2f ; (writeSector.s8 + 0)
.s6:
2e12 : ad f9 bf LDA $bff9 ; (sstack + 3)
2e15 : 85 17 __ STA P10 
2e17 : ad fa bf LDA $bffa ; (sstack + 4)
2e1a : 85 18 __ STA P11 
2e1c : ad fb bf LDA $bffb ; (sstack + 5)
2e1f : 8d f6 bf STA $bff6 ; (sstack + 0)
2e22 : ad fc bf LDA $bffc ; (sstack + 6)
2e25 : 8d f7 bf STA $bff7 ; (sstack + 1)
2e28 : 20 84 2e JSR $2e84 ; (saveBufferToSector.s4 + 0)
2e2b : 24 1c __ BIT ACCU + 1 ; (track + 0)
2e2d : 10 04 __ BPL $2e33 ; (writeSector.s7 + 0)
.s8:
2e2f : a9 ff __ LDA #$ff
2e31 : d0 02 __ BNE $2e35 ; (writeSector.s3 + 0)
.s7:
2e33 : a9 00 __ LDA #$00
.s3:
2e35 : 85 1b __ STA ACCU + 0 ; (driveid + 0)
2e37 : 85 1c __ STA ACCU + 1 ; (track + 0)
2e39 : 60 __ __ RTS
--------------------------------------------------------------------
writeMemToBuffer: ; writeMemToBuffer()->i16
.s4:
2e3a : a9 10 __ LDA #$10
2e3c : 85 0e __ STA P1 
2e3e : a9 2e __ LDA #$2e
2e40 : 85 10 __ STA P3 
2e42 : a9 7c __ LDA #$7c
2e44 : 85 0f __ STA P2 
2e46 : 20 d6 23 JSR $23d6 ; (krnio_puts.s4 + 0)
2e49 : a5 1c __ LDA ACCU + 1 
2e4b : 30 1f __ BMI $2e6c ; (writeMemToBuffer.s7 + 0)
.s8:
2e4d : 05 1b __ ORA ACCU + 0 
2e4f : f0 1b __ BEQ $2e6c ; (writeMemToBuffer.s7 + 0)
.s5:
2e51 : a9 09 __ LDA #$09
2e53 : 85 0e __ STA P1 
2e55 : a9 31 __ LDA #$31
2e57 : 85 10 __ STA P3 
2e59 : a9 00 __ LDA #$00
2e5b : 85 11 __ STA P4 
2e5d : a9 01 __ LDA #$01
2e5f : 85 12 __ STA P5 
2e61 : a9 00 __ LDA #$00
2e63 : 85 0f __ STA P2 
2e65 : 20 6a 2b JSR $2b6a ; (krnio_write.s4 + 0)
2e68 : 24 1c __ BIT ACCU + 1 
2e6a : 10 09 __ BPL $2e75 ; (writeMemToBuffer.s6 + 0)
.s7:
2e6c : a9 09 __ LDA #$09
2e6e : 20 43 24 JSR $2443 ; (krnio_close.s4 + 0)
2e71 : a9 ff __ LDA #$ff
2e73 : d0 02 __ BNE $2e77 ; (writeMemToBuffer.s3 + 0)
.s6:
2e75 : a9 00 __ LDA #$00
.s3:
2e77 : 85 1b __ STA ACCU + 0 
2e79 : 85 1c __ STA ACCU + 1 
2e7b : 60 __ __ RTS
--------------------------------------------------------------------
2e7c : __ __ __ BYT 42 2d 50 20 36 20 30 00                         : B-P 6 0.
--------------------------------------------------------------------
saveBufferToSector: ; saveBufferToSector(u8,u8,struct sstr*)->i16
.s4:
2e84 : a9 c8 __ LDA #$c8
2e86 : 85 0d __ STA P0 
2e88 : a9 2f __ LDA #$2f
2e8a : 85 10 __ STA P3 
2e8c : a9 bf __ LDA #$bf
2e8e : 85 0e __ STA P1 
2e90 : a9 00 __ LDA #$00
2e92 : 85 0f __ STA P2 
2e94 : 20 a3 21 JSR $21a3 ; (set_sstr.s4 + 0)
2e97 : a5 17 __ LDA P10 ; (track + 0)
2e99 : 85 15 __ STA P8 
2e9b : a9 c8 __ LDA #$c8
2e9d : 85 13 __ STA P6 
2e9f : a9 bf __ LDA #$bf
2ea1 : 85 14 __ STA P7 
2ea3 : a9 00 __ LDA #$00
2ea5 : 85 16 __ STA P9 
2ea7 : 20 c6 21 JSR $21c6 ; (append_sstr_num.s4 + 0)
2eaa : a9 c8 __ LDA #$c8
2eac : 85 0d __ STA P0 
2eae : a9 2d __ LDA #$2d
2eb0 : 85 10 __ STA P3 
2eb2 : a9 bf __ LDA #$bf
2eb4 : 85 0e __ STA P1 
2eb6 : a9 5f __ LDA #$5f
2eb8 : 85 0f __ STA P2 
2eba : 20 95 22 JSR $2295 ; (append_sstr.s4 + 0)
2ebd : a5 18 __ LDA P11 ; (sec + 0)
2ebf : 85 15 __ STA P8 
2ec1 : 20 c6 21 JSR $21c6 ; (append_sstr_num.s4 + 0)
2ec4 : a9 10 __ LDA #$10
2ec6 : 85 0e __ STA P1 
2ec8 : a9 bf __ LDA #$bf
2eca : 85 10 __ STA P3 
2ecc : a9 c9 __ LDA #$c9
2ece : 85 0f __ STA P2 
2ed0 : 20 d6 23 JSR $23d6 ; (krnio_puts.s4 + 0)
2ed3 : a5 1b __ LDA ACCU + 0 
2ed5 : 85 49 __ STA T0 + 0 
2ed7 : a5 1c __ LDA ACCU + 1 
2ed9 : 85 4a __ STA T0 + 1 
2edb : a9 09 __ LDA #$09
2edd : 20 43 24 JSR $2443 ; (krnio_close.s4 + 0)
2ee0 : a5 4a __ LDA T0 + 1 
2ee2 : 30 11 __ BMI $2ef5 ; (saveBufferToSector.s6 + 0)
.s7:
2ee4 : 05 49 __ ORA T0 + 0 
2ee6 : f0 0d __ BEQ $2ef5 ; (saveBufferToSector.s6 + 0)
.s5:
2ee8 : ad f6 bf LDA $bff6 ; (sstack + 0)
2eeb : 85 13 __ STA P6 
2eed : ad f7 bf LDA $bff7 ; (sstack + 1)
2ef0 : 85 14 __ STA P7 
2ef2 : 4c 08 2f JMP $2f08 ; (waitForWriteStatus.s4 + 0)
.s6:
2ef5 : a9 ff __ LDA #$ff
2ef7 : 85 1b __ STA ACCU + 0 
2ef9 : 85 1c __ STA ACCU + 1 
.s3:
2efb : 60 __ __ RTS
--------------------------------------------------------------------
2efc : __ __ __ BYT 2e 00                                           : ..
--------------------------------------------------------------------
spentry:
2efe : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
giocharmap:
2eff : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
2f00 : __ __ __ BYT 55 32 20 36 20 30 20 00                         : U2 6 0 .
--------------------------------------------------------------------
waitForWriteStatus: ; waitForWriteStatus(struct sstr*)->i16
.s4:
2f08 : a9 10 __ LDA #$10
2f0a : 85 0e __ STA P1 
2f0c : 85 11 __ STA P4 
2f0e : a9 00 __ LDA #$00
2f10 : 85 12 __ STA P5 
2f12 : 18 __ __ CLC
2f13 : a5 13 __ LDA P6 ; (status_str + 0)
2f15 : 69 01 __ ADC #$01
2f17 : 85 0f __ STA P2 
2f19 : a5 14 __ LDA P7 ; (status_str + 1)
2f1b : 69 00 __ ADC #$00
2f1d : 85 10 __ STA P3 
2f1f : 20 4b 24 JSR $244b ; (krnio_read.s4 + 0)
2f22 : a9 00 __ LDA #$00
2f24 : a0 10 __ LDY #$10
2f26 : 91 13 __ STA (P6),y ; (status_str + 0)
2f28 : a5 0f __ LDA P2 
2f2a : 85 0d __ STA P0 
2f2c : a5 10 __ LDA P3 
2f2e : 85 0e __ STA P1 
2f30 : 20 ea 24 JSR $24ea ; (atoi.l4 + 0)
2f33 : a5 1b __ LDA ACCU + 0 
2f35 : 85 47 __ STA T0 + 0 
2f37 : a5 1c __ LDA ACCU + 1 
2f39 : 85 48 __ STA T0 + 1 
2f3b : a9 09 __ LDA #$09
2f3d : 20 43 24 JSR $2443 ; (krnio_close.s4 + 0)
2f40 : a5 48 __ LDA T0 + 1 
2f42 : 30 08 __ BMI $2f4c ; (waitForWriteStatus.s5 + 0)
.s8:
2f44 : d0 0a __ BNE $2f50 ; (waitForWriteStatus.s6 + 0)
.s7:
2f46 : a5 47 __ LDA T0 + 0 
2f48 : c9 14 __ CMP #$14
2f4a : b0 04 __ BCS $2f50 ; (waitForWriteStatus.s6 + 0)
.s5:
2f4c : a9 00 __ LDA #$00
2f4e : f0 02 __ BEQ $2f52 ; (waitForWriteStatus.s3 + 0)
.s6:
2f50 : a9 ff __ LDA #$ff
.s3:
2f52 : 85 1b __ STA ACCU + 0 
2f54 : 85 1c __ STA ACCU + 1 
2f56 : 60 __ __ RTS
--------------------------------------------------------------------
setNormalXY: ; setNormalXY(u8,u8)->void
.s4:
2f57 : a5 0e __ LDA P1 ; (y + 0)
2f59 : 0a __ __ ASL
2f5a : 85 1b __ STA ACCU + 0 
2f5c : a9 00 __ LDA #$00
2f5e : 2a __ __ ROL
2f5f : 06 1b __ ASL ACCU + 0 
2f61 : 2a __ __ ROL
2f62 : aa __ __ TAX
2f63 : a5 1b __ LDA ACCU + 0 
2f65 : 65 0e __ ADC P1 ; (y + 0)
2f67 : 85 1b __ STA ACCU + 0 
2f69 : 8a __ __ TXA
2f6a : 69 00 __ ADC #$00
2f6c : 06 1b __ ASL ACCU + 0 
2f6e : 2a __ __ ROL
2f6f : 06 1b __ ASL ACCU + 0 
2f71 : 2a __ __ ROL
2f72 : 06 1b __ ASL ACCU + 0 
2f74 : 2a __ __ ROL
2f75 : 69 d8 __ ADC #$d8
2f77 : 85 1c __ STA ACCU + 1 
2f79 : a9 0f __ LDA #$0f
2f7b : a4 0d __ LDY P0 ; (x + 0)
2f7d : 91 1b __ STA (ACCU + 0),y 
.s3:
2f7f : 60 __ __ RTS
--------------------------------------------------------------------
2f80 : __ __ __ BYT 4a 4f 42 20 43 4f 4d 50 4c 45 54 45 44 21 20 50 : JOB COMPLETED! P
2f90 : __ __ __ BYT 52 45 53 53 20 c3 20 4f 52 20 d1 20 20 20 00    : RESS . OR .   .
--------------------------------------------------------------------
2f9f : __ __ __ BYT 43 4f 50 59 20 45 52 52 4f 52 21 20 50 52 45 53 : COPY ERROR! PRES
2faf : __ __ __ BYT 53 20 c3 20 4f 52 20 d1 20 20 20 20 20 20 00    : S . OR .      .
--------------------------------------------------------------------
divmod: ; divmod
2fbe : a5 1c __ LDA ACCU + 1 
2fc0 : d0 31 __ BNE $2ff3 ; (divmod + 53)
2fc2 : a5 04 __ LDA WORK + 1 
2fc4 : d0 1e __ BNE $2fe4 ; (divmod + 38)
2fc6 : 85 06 __ STA WORK + 3 
2fc8 : a2 04 __ LDX #$04
2fca : 06 1b __ ASL ACCU + 0 
2fcc : 2a __ __ ROL
2fcd : c5 03 __ CMP WORK + 0 
2fcf : 90 02 __ BCC $2fd3 ; (divmod + 21)
2fd1 : e5 03 __ SBC WORK + 0 
2fd3 : 26 1b __ ROL ACCU + 0 
2fd5 : 2a __ __ ROL
2fd6 : c5 03 __ CMP WORK + 0 
2fd8 : 90 02 __ BCC $2fdc ; (divmod + 30)
2fda : e5 03 __ SBC WORK + 0 
2fdc : 26 1b __ ROL ACCU + 0 
2fde : ca __ __ DEX
2fdf : d0 eb __ BNE $2fcc ; (divmod + 14)
2fe1 : 85 05 __ STA WORK + 2 
2fe3 : 60 __ __ RTS
2fe4 : a5 1b __ LDA ACCU + 0 
2fe6 : 85 05 __ STA WORK + 2 
2fe8 : a5 1c __ LDA ACCU + 1 
2fea : 85 06 __ STA WORK + 3 
2fec : a9 00 __ LDA #$00
2fee : 85 1b __ STA ACCU + 0 
2ff0 : 85 1c __ STA ACCU + 1 
2ff2 : 60 __ __ RTS
2ff3 : a5 04 __ LDA WORK + 1 
2ff5 : d0 1f __ BNE $3016 ; (divmod + 88)
2ff7 : a5 03 __ LDA WORK + 0 
2ff9 : 30 1b __ BMI $3016 ; (divmod + 88)
2ffb : a9 00 __ LDA #$00
2ffd : 85 06 __ STA WORK + 3 
2fff : a2 10 __ LDX #$10
3001 : 06 1b __ ASL ACCU + 0 
3003 : 26 1c __ ROL ACCU + 1 
3005 : 2a __ __ ROL
3006 : c5 03 __ CMP WORK + 0 
3008 : 90 02 __ BCC $300c ; (divmod + 78)
300a : e5 03 __ SBC WORK + 0 
300c : 26 1b __ ROL ACCU + 0 
300e : 26 1c __ ROL ACCU + 1 
3010 : ca __ __ DEX
3011 : d0 f2 __ BNE $3005 ; (divmod + 71)
3013 : 85 05 __ STA WORK + 2 
3015 : 60 __ __ RTS
3016 : a9 00 __ LDA #$00
3018 : 85 05 __ STA WORK + 2 
301a : 85 06 __ STA WORK + 3 
301c : 84 02 __ STY $02 
301e : a0 10 __ LDY #$10
3020 : 18 __ __ CLC
3021 : 26 1b __ ROL ACCU + 0 
3023 : 26 1c __ ROL ACCU + 1 
3025 : 26 05 __ ROL WORK + 2 
3027 : 26 06 __ ROL WORK + 3 
3029 : 38 __ __ SEC
302a : a5 05 __ LDA WORK + 2 
302c : e5 03 __ SBC WORK + 0 
302e : aa __ __ TAX
302f : a5 06 __ LDA WORK + 3 
3031 : e5 04 __ SBC WORK + 1 
3033 : 90 04 __ BCC $3039 ; (divmod + 123)
3035 : 86 05 __ STX WORK + 2 
3037 : 85 06 __ STA WORK + 3 
3039 : 88 __ __ DEY
303a : d0 e5 __ BNE $3021 ; (divmod + 99)
303c : 26 1b __ ROL ACCU + 0 
303e : 26 1c __ ROL ACCU + 1 
3040 : a4 02 __ LDY $02 
3042 : 60 __ __ RTS
--------------------------------------------------------------------
r1:
3043 : __ __ __ BYT 70 40 40 40 40 40 40 40 40 40 40 40 40 6e 00    : p@@@@@@@@@@@@n.
--------------------------------------------------------------------
r2:
3052 : __ __ __ BYT 5d 20 20 20 20 20 20 20 20 20 20 20 20 5d 00    : ]            ].
--------------------------------------------------------------------
r3:
3061 : __ __ __ BYT 5d 20 6f 6f 6f 62 62 62 6f 6f 6f 20 20 5d 00    : ] ooobbbooo  ].
--------------------------------------------------------------------
r4:
3070 : __ __ __ BYT 5d 20 20 20 20 78 78 78 20 20 20 20 20 5d 00    : ]    xxx     ].
--------------------------------------------------------------------
r5:
307f : __ __ __ BYT 5d 20 2e 20 20 20 20 20 20 20 20 20 20 5d 00    : ] .          ].
--------------------------------------------------------------------
r6:
308e : __ __ __ BYT 6d 40 40 40 40 40 40 40 40 40 40 40 40 7d 00    : m@@@@@@@@@@@@}.
--------------------------------------------------------------------
CIA1_TODH:
309d : __ __ __ BYT 0b dc                                           : ..
--------------------------------------------------------------------
CIA1_TODM:
309f : __ __ __ BYT 0a dc                                           : ..
--------------------------------------------------------------------
CIA1_TODS:
30a1 : __ __ __ BYT 09 dc                                           : ..
--------------------------------------------------------------------
CIA1_TODT:
30a3 : __ __ __ BYT 08 dc                                           : ..
--------------------------------------------------------------------
30a5 : __ __ __ BYT 00 00 2e 00 00 00                               : ......
--------------------------------------------------------------------
sectors:
30ab : __ __ __ BSS	35
--------------------------------------------------------------------
keyb_key:
30ce : __ __ __ BSS	1
--------------------------------------------------------------------
keyb_matrix:
30cf : __ __ __ BSS	8
--------------------------------------------------------------------
ciaa_pra_def:
30d7 : __ __ __ BSS	1
--------------------------------------------------------------------
krnio_pstatus:
30d8 : __ __ __ BSS	16
--------------------------------------------------------------------
buffer:
3100 : __ __ __ BSS	256

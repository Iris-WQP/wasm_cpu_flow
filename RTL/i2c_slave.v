`define ASIC

module i2c_slave ( clk, rstn, I_DEV_ADR, isda, osda, isck
`ifdef ASIC
	, reg00d, reg01d, reg02d, reg03d, reg04d, reg05d, reg06d, reg07d
	, reg08d, reg09d, reg0Ad, reg0Bd, reg0Cd, reg0Dd, reg0Ed, reg0Fd
	, reg10d, reg11d, reg12d, reg13d, reg14d, reg15d, reg16d, reg17d
	, reg18d, reg19d, reg1Ad, reg1Bd, reg1Cd, reg1Dd, reg1Ed, reg1Fd
	, reg20d, reg21d, reg22d, reg23d, reg24d, reg25d, reg26d, reg27d
	, reg28d, reg29d, reg2Ad, reg2Bd, reg2Cd, reg2Dd, reg2Ed, reg2Fd
	, reg30d, reg31d, reg32d, reg33d, reg34d, reg35d, reg36d, reg37d
	, reg38d, reg39d, reg3Ad, reg3Bd, reg3Cd, reg3Dd, reg3Ed, reg3Fd
	, reg40d, reg41d, reg42d, reg43d, reg44d, reg45d, reg46d, reg47d
	, reg48d, reg49d, reg4Ad, reg4Bd, reg4Cd, reg4Dd, reg4Ed, reg4Fd
	, reg50d, reg51d, reg52d, reg53d, reg54d, reg55d, reg56d, reg57d
	, reg58d, reg59d, reg5Ad, reg5Bd, reg5Cd, reg5Dd, reg5Ed, reg5Fd
	, reg60d, reg61d, reg62d, reg63d, reg64d, reg65d, reg66d, reg67d
	, reg68d, reg69d, reg6Ad, reg6Bd, reg6Cd, reg6Dd, reg6Ed, reg6Fd
	, reg70d, reg71d, reg72d, reg73d, reg74d, reg75d, reg76d, reg77d
	, reg78d, reg79d, reg7Ad, reg7Bd, reg7Cd, reg7Dd, reg7Ed, reg7Fd
	, reg80d, reg81d, reg82d, reg83d, reg84d, reg85d, reg86d, reg87d
	, reg88d, reg89d, reg8Ad, reg8Bd, reg8Cd, reg8Dd, reg8Ed, reg8Fd
	, reg90d, reg91d, reg92d, reg93d, reg94d, reg95d, reg96d, reg97d
	, reg98d, reg99d, reg9Ad, reg9Bd, reg9Cd, reg9Dd, reg9Ed, reg9Fd
	, regA0d, regA1d, regA2d, regA3d, regA4d, regA5d, regA6d, regA7d
	, regA8d, regA9d, regAAd, regABd, regACd, regADd, regAEd, regAFd
	, regB0d, regB1d, regB2d, regB3d, regB4d, regB5d, regB6d, regB7d
	, regB8d, regB9d, regBAd, regBBd, regBCd, regBDd, regBEd, regBFd
	, regC0d, regC1d, regC2d, regC3d, regC4d, regC5d, regC6d, regC7d
	, regC8d, regC9d, regCAd, regCBd, regCCd, regCDd, regCEd, regCFd
	, regD0d, regD1d, regD2d, regD3d, regD4d, regD5d, regD6d, regD7d
	, regD8d, regD9d, regDAd, regDBd, regDCd, regDDd, regDEd, regDFd
	, regE0d, regE1d, regE2d, regE3d, regE4d, regE5d, regE6d, regE7d
	, regE8d, regE9d, regEAd, regEBd, regECd, regEDd, regEEd, regEFd
	, regF0d, regF1d, regF2d, regF3d, regF4d, regF5d, regF6d, regF7d
	, regF8d, regF9d, regFAd, regFBd, regFCd, regFDd, regFEd, regFFd

  , ireg02d, ireg03d, ireg04d, ireg05d, ireg06d, ireg07d
  , ireg08d, ireg09d, ireg0Ad, ireg0Bd, ireg0Cd, ireg0Dd, ireg0Ed, ireg0Fd
  , ireg10d, ireg11d, ireg12d, ireg13d, ireg14d, ireg15d, ireg16d, ireg17d
  , ireg18d, ireg19d, ireg1Ad, ireg1Bd, ireg1Cd, ireg1Dd, ireg1Ed, ireg1Fd
  , ireg20d, ireg21d, ireg22d
`endif
	 );
input	clk;
input	rstn;
input	[7:1]	I_DEV_ADR;	// Device address
input	isda;
output	reg osda;
input	isck;
`ifdef ASIC
output	reg[7:0]	reg00d,reg01d,
reg02d,reg03d,reg04d,reg05d,reg06d,reg07d;
output	reg[7:0]	reg08d,reg09d,reg0Ad,reg0Bd,reg0Cd,reg0Dd,reg0Ed,reg0Fd;
output	reg[7:0]	reg10d,reg11d,reg12d,reg13d,reg14d,reg15d,reg16d,reg17d;
output	reg[7:0]	reg18d,reg19d,reg1Ad,reg1Bd,reg1Cd,reg1Dd,reg1Ed,reg1Fd;
output	reg[7:0]	reg20d,reg21d,reg22d,reg23d,reg24d,reg25d,reg26d,reg27d;
output	reg[7:0]	reg28d,reg29d,reg2Ad,reg2Bd,reg2Cd,reg2Dd,reg2Ed,reg2Fd;
output	reg[7:0]	reg30d,reg31d,reg32d,reg33d,reg34d,reg35d,reg36d,reg37d;
output	reg[7:0]	reg38d,reg39d,reg3Ad,reg3Bd,reg3Cd,reg3Dd,reg3Ed,reg3Fd;
output	reg[7:0]	reg40d,reg41d,reg42d,reg43d,reg44d,reg45d,reg46d,reg47d;
output	reg[7:0]	reg48d,reg49d,reg4Ad,reg4Bd,reg4Cd,reg4Dd,reg4Ed,reg4Fd;
output	reg[7:0]	reg50d,reg51d,reg52d,reg53d,reg54d,reg55d,reg56d,reg57d;
output	reg[7:0]	reg58d,reg59d,reg5Ad,reg5Bd,reg5Cd,reg5Dd,reg5Ed,reg5Fd;
output	reg[7:0]	reg60d,reg61d,reg62d,reg63d,reg64d,reg65d,reg66d,reg67d;
output	reg[7:0]	reg68d,reg69d,reg6Ad,reg6Bd,reg6Cd,reg6Dd,reg6Ed,reg6Fd;
output	reg[7:0]	reg70d,reg71d,reg72d,reg73d,reg74d,reg75d,reg76d,reg77d;
output	reg[7:0]	reg78d,reg79d,reg7Ad,reg7Bd,reg7Cd,reg7Dd,reg7Ed,reg7Fd;
output	reg[7:0]	reg80d,reg81d,reg82d,reg83d,reg84d,reg85d,reg86d,reg87d;
output	reg[7:0]	reg88d,reg89d,reg8Ad,reg8Bd,reg8Cd,reg8Dd,reg8Ed,reg8Fd;
output	reg[7:0]	reg90d,reg91d,reg92d,reg93d,reg94d,reg95d,reg96d,reg97d;
output	reg[7:0]	reg98d,reg99d,reg9Ad,reg9Bd,reg9Cd,reg9Dd,reg9Ed,reg9Fd;
output	reg[7:0]	regA0d,regA1d,regA2d,regA3d,regA4d,regA5d,regA6d,regA7d;
output	reg[7:0]	regA8d,regA9d,regAAd,regABd,regACd,regADd,regAEd,regAFd;
output	reg[7:0]	regB0d,regB1d,regB2d,regB3d,regB4d,regB5d,regB6d,regB7d;
output	reg[7:0]	regB8d,regB9d,regBAd,regBBd,regBCd,regBDd,regBEd,regBFd;
output	reg[7:0]	regC0d,regC1d,regC2d,regC3d,regC4d,regC5d,regC6d,regC7d;
output	reg[7:0]	regC8d,regC9d,regCAd,regCBd,regCCd,regCDd,regCEd,regCFd;
output	reg[7:0]	regD0d,regD1d,regD2d,regD3d,regD4d,regD5d,regD6d,regD7d;
output	reg[7:0]	regD8d,regD9d,regDAd,regDBd,regDCd,regDDd,regDEd,regDFd;
output	reg[7:0]	regE0d,regE1d,regE2d,regE3d,regE4d,regE5d,regE6d,regE7d;
output	reg[7:0]	regE8d,regE9d,regEAd,regEBd,regECd,regEDd,regEEd,regEFd;
output	reg[7:0]	regF0d,regF1d,regF2d,regF3d,regF4d,regF5d,regF6d,regF7d;
output	reg[7:0]	regF8d,regF9d,regFAd,regFBd,regFCd,regFDd,regFEd,regFFd;

input [7:0] ireg02d, ireg03d, ireg04d, ireg05d, ireg06d, ireg07d, ireg08d, ireg09d, 
ireg0Ad, ireg0Bd, ireg0Cd, ireg0Dd, ireg0Ed, ireg0Fd, ireg10d, ireg11d, 
ireg12d, ireg13d, ireg14d, ireg15d, ireg16d, ireg17d, ireg18d, ireg19d, 
ireg1Ad, ireg1Bd, ireg1Cd, ireg1Dd, ireg1Ed, ireg1Fd, ireg20d, ireg21d, ireg22d;
`else
reg[7:0]	reg00d,reg01d,reg02d,reg03d,reg04d,reg05d,reg06d,reg07d;
reg[7:0]	reg08d,reg09d,reg0Ad,reg0Bd,reg0Cd,reg0Dd,reg0Ed,reg0Fd;
reg[7:0]	reg10d,reg11d,reg12d,reg13d,reg14d,reg15d,reg16d,reg17d;
reg[7:0]	reg18d,reg19d,reg1Ad,reg1Bd,reg1Cd,reg1Dd,reg1Ed,reg1Fd;
reg[7:0]	reg20d,reg21d,reg22d,reg23d,reg24d,reg25d,reg26d,reg27d;
reg[7:0]	reg28d,reg29d,reg2Ad,reg2Bd,reg2Cd,reg2Dd,reg2Ed,reg2Fd;
reg[7:0]	reg30d,reg31d,reg32d,reg33d,reg34d,reg35d,reg36d,reg37d;
reg[7:0]	reg38d,reg39d,reg3Ad,reg3Bd,reg3Cd,reg3Dd,reg3Ed,reg3Fd;
reg[7:0]	reg40d,reg41d,reg42d,reg43d,reg44d,reg45d,reg46d,reg47d;
reg[7:0]	reg48d,reg49d,reg4Ad,reg4Bd,reg4Cd,reg4Dd,reg4Ed,reg4Fd;
reg[7:0]	reg50d,reg51d,reg52d,reg53d,reg54d,reg55d,reg56d,reg57d;
reg[7:0]	reg58d,reg59d,reg5Ad,reg5Bd,reg5Cd,reg5Dd,reg5Ed,reg5Fd;
reg[7:0]	reg60d,reg61d,reg62d,reg63d,reg64d,reg65d,reg66d,reg67d;
reg[7:0]	reg68d,reg69d,reg6Ad,reg6Bd,reg6Cd,reg6Dd,reg6Ed,reg6Fd;
reg[7:0]	reg70d,reg71d,reg72d,reg73d,reg74d,reg75d,reg76d,reg77d;
reg[7:0]	reg78d,reg79d,reg7Ad,reg7Bd,reg7Cd,reg7Dd,reg7Ed,reg7Fd;
reg[7:0]	reg80d,reg81d,reg82d,reg83d,reg84d,reg85d,reg86d,reg87d;
reg[7:0]	reg88d,reg89d,reg8Ad,reg8Bd,reg8Cd,reg8Dd,reg8Ed,reg8Fd;
reg[7:0]	reg90d,reg91d,reg92d,reg93d,reg94d,reg95d,reg96d,reg97d;
reg[7:0]	reg98d,reg99d,reg9Ad,reg9Bd,reg9Cd,reg9Dd,reg9Ed,reg9Fd;
reg[7:0]	regA0d,regA1d,regA2d,regA3d,regA4d,regA5d,regA6d,regA7d;
reg[7:0]	regA8d,regA9d,regAAd,regABd,regACd,regADd,regAEd,regAFd;
reg[7:0]	regB0d,regB1d,regB2d,regB3d,regB4d,regB5d,regB6d,regB7d;
reg[7:0]	regB8d,regB9d,regBAd,regBBd,regBCd,regBDd,regBEd,regBFd;
reg[7:0]	regC0d,regC1d,regC2d,regC3d,regC4d,regC5d,regC6d,regC7d;
reg[7:0]	regC8d,regC9d,regCAd,regCBd,regCCd,regCDd,regCEd,regCFd;
reg[7:0]	regD0d,regD1d,regD2d,regD3d,regD4d,regD5d,regD6d,regD7d;
reg[7:0]	regD8d,regD9d,regDAd,regDBd,regDCd,regDDd,regDEd,regDFd;
reg[7:0]	regE0d,regE1d,regE2d,regE3d,regE4d,regE5d,regE6d,regE7d;
reg[7:0]	regE8d,regE9d,regEAd,regEBd,regECd,regEDd,regEEd,regEFd;
reg[7:0]	regF0d,regF1d,regF2d,regF3d,regF4d,regF5d,regF6d,regF7d;
reg[7:0]	regF8d,regF9d,regFAd,regFBd,regFCd,regFDd,regFEd,regFFd;
`endif

// Initial value define
`ifdef ASIC
parameter	INI00D = 8'h00;
parameter	INI01D = 8'h00;
parameter	INI02D = 8'h00;
parameter	INI03D = 8'h00;
parameter	INI04D = 8'h00;
parameter	INI05D = 8'h00;
parameter	INI06D = 8'h00;
parameter	INI07D = 8'h00;
parameter	INI08D = 8'h00;
parameter	INI09D = 8'h00;
parameter	INI0AD = 8'h00;
parameter	INI0BD = 8'h00;
parameter	INI0CD = 8'h00;
parameter	INI0DD = 8'h00;
parameter	INI0ED = 8'h00;
parameter	INI0FD = 8'h00;
parameter	INI10D = 8'h00;
parameter	INI11D = 8'h00;
parameter	INI12D = 8'h00;
parameter	INI13D = 8'h00;
parameter	INI14D = 8'h00;
parameter	INI15D = 8'h00;
parameter	INI16D = 8'h00;
parameter	INI17D = 8'h00;
parameter	INI18D = 8'h00;
parameter	INI19D = 8'h00;
parameter	INI1AD = 8'h00;
parameter	INI1BD = 8'h00;
parameter	INI1CD = 8'h00;
parameter	INI1DD = 8'h00;
parameter	INI1ED = 8'h00;
parameter	INI1FD = 8'h00;
parameter	INI20D = 8'h00;
parameter	INI21D = 8'h00;
parameter	INI22D = 8'h00;
parameter	INI23D = 8'h00;
parameter	INI24D = 8'h00;
parameter	INI25D = 8'h00;
parameter	INI26D = 8'h00;
parameter	INI27D = 8'h00;
parameter	INI28D = 8'h00;
parameter	INI29D = 8'h00;
parameter	INI2AD = 8'h00;
parameter	INI2BD = 8'h00;
parameter	INI2CD = 8'h00;
parameter	INI2DD = 8'h00;
parameter	INI2ED = 8'h00;
parameter	INI2FD = 8'h00;
parameter	INI30D = 8'hFF; //global_offset[13:8]
parameter	INI31D = 8'h00; //global_offset[7:0]	
parameter	INI32D = 8'h31;	//EMA_EMAW
parameter	INI33D = 8'h00;	
parameter	INI34D = 8'h00;	
parameter	INI35D = 8'h00;	
parameter	INI36D = 8'h00;	
parameter	INI37D = 8'h00;	
parameter	INI38D = 8'h00;	
parameter	INI39D = 8'h00;	
parameter	INI3AD = 8'h00;	
parameter	INI3BD = 8'h00;	
parameter	INI3CD = 8'h00;	
parameter	INI3DD = 8'h00;	
parameter	INI3ED = 8'h00;	
parameter	INI3FD = 8'h00;	
parameter	INI40D = 8'h00;
parameter	INI41D = 8'h00;
parameter	INI42D = 8'h00;
parameter	INI43D = 8'h00;
parameter	INI44D = 8'h00;
parameter	INI45D = 8'h00;	
parameter	INI46D = 8'h00;	
parameter	INI47D = 8'h00;	
parameter	INI48D = 8'h00;	
parameter	INI49D = 8'h00;	
parameter	INI4AD = 8'h00;	
parameter	INI4BD = 8'h00;
parameter	INI4CD = 8'h00;	
parameter	INI4DD = 8'h00;	
parameter	INI4ED = 8'h00;	
parameter	INI4FD = 8'h00;	
parameter	INI50D = 8'h00;	
parameter	INI51D = 8'h00;	
parameter	INI52D = 8'h00;	
parameter	INI53D = 8'h00;	
parameter	INI54D = 8'h00;	
parameter	INI55D = 8'h00;	
parameter	INI56D = 8'h00;	
parameter	INI57D = 8'h00;	
parameter	INI58D = 8'h00;
parameter	INI59D = 8'h00;
parameter	INI5AD = 8'h00;
parameter	INI5BD = 8'h00;
parameter	INI5CD = 8'h00;
parameter	INI5DD = 8'h00;
parameter	INI5ED = 8'h00;
parameter	INI5FD = 8'h00;
parameter	INI60D = 8'h00;	
parameter	INI61D = 8'h00;	
parameter	INI62D = 8'h00;	
parameter	INI63D = 8'h00;	
parameter	INI64D = 8'h00;	
parameter	INI65D = 8'h00;	
parameter	INI66D = 8'h00;	
parameter	INI67D = 8'h00;	
parameter	INI68D = 8'h00;	
parameter	INI69D = 8'h00;	
parameter	INI6AD = 8'h00;	
parameter	INI6BD = 8'h00;	
parameter	INI6CD = 8'h00;	
parameter	INI6DD = 8'h00;	
parameter	INI6ED = 8'h00;
parameter	INI6FD = 8'h00;
parameter	INI70D = 8'h00;
parameter	INI71D = 8'h00;
parameter	INI72D = 8'h00;
parameter	INI73D = 8'h00;
parameter	INI74D = 8'h00;
parameter	INI75D = 8'h00;
parameter	INI76D = 8'h00;
parameter	INI77D = 8'h00;
parameter	INI78D = 8'h00;
parameter	INI79D = 8'h00;
parameter	INI7AD = 8'h00;
parameter	INI7BD = 8'h00;
parameter	INI7CD = 8'h00;
parameter	INI7DD = 8'h00;
parameter	INI7ED = 8'h18; // INPUT PAD
parameter	INI7FD = 8'h18; // ...
parameter	INI80D = 8'h18;
parameter	INI81D = 8'h18;
parameter	INI82D = 8'h18;
parameter	INI83D = 8'h18;
parameter	INI84D = 8'h18;
parameter	INI85D = 8'h18;
parameter	INI86D = 8'h18;
parameter	INI87D = 8'h18;
parameter	INI88D = 8'h18;
parameter	INI89D = 8'h18;
parameter	INI8AD = 8'h18;
parameter	INI8BD = 8'h18;
parameter	INI8CD = 8'h18;
parameter	INI8DD = 8'h18;
parameter	INI8ED = 8'h18;
parameter	INI8FD = 8'h18;
parameter	INI90D = 8'h18;
parameter	INI91D = 8'h18;
parameter	INI92D = 8'h18;
parameter	INI93D = 8'h18;
parameter	INI94D = 8'h18;
parameter	INI95D = 8'h18;
parameter	INI96D = 8'h18;
parameter	INI97D = 8'h18;
parameter	INI98D = 8'h18;
parameter	INI99D = 8'h18;
parameter	INI9AD = 8'h18;
parameter	INI9BD = 8'h18;
parameter	INI9CD = 8'h18;
parameter	INI9DD = 8'h18;
parameter	INI9ED = 8'h18;
parameter	INI9FD = 8'h18;
parameter	INIA0D = 8'h18;
parameter	INIA1D = 8'h18;
parameter	INIA2D = 8'h18;
parameter	INIA3D = 8'h18;
parameter	INIA4D = 8'h18;
parameter	INIA5D = 8'h18;
parameter	INIA6D = 8'h18;
parameter	INIA7D = 8'h18;
parameter	INIA8D = 8'h18;
parameter	INIA9D = 8'h18;
parameter	INIAAD = 8'h18;
parameter	INIABD = 8'h18;
parameter	INIACD = 8'h18;
parameter	INIADD = 8'h18;
parameter	INIAED = 8'h18;
parameter	INIAFD = 8'h18;
parameter	INIB0D = 8'h18;
parameter	INIB1D = 8'h18;
parameter	INIB2D = 8'h18;
parameter	INIB3D = 8'h18;
parameter	INIB4D = 8'h18;
parameter	INIB5D = 8'h18;
parameter	INIB6D = 8'h18;
parameter	INIB7D = 8'h18;
parameter	INIB8D = 8'h18;
parameter	INIB9D = 8'h18;
parameter	INIBAD = 8'h18;
parameter	INIBBD = 8'h18;
parameter	INIBCD = 8'h18;
parameter	INIBDD = 8'h18;
parameter	INIBED = 8'h18;
parameter	INIBFD = 8'h18;
parameter	INIC0D = 8'h18;
parameter	INIC1D = 8'h18;
parameter	INIC2D = 8'h18;
parameter	INIC3D = 8'h18;
parameter	INIC4D = 8'h18;
parameter	INIC5D = 8'h18;
parameter	INIC6D = 8'h18;
parameter	INIC7D = 8'h18;
parameter	INIC8D = 8'h18;
parameter	INIC9D = 8'h18;
parameter	INICAD = 8'h18;
parameter	INICBD = 8'h18;
parameter	INICCD = 8'h18;
parameter	INICDD = 8'h18;
parameter	INICED = 8'h18;
parameter	INICFD = 8'h18;
parameter	INID0D = 8'h18;
parameter	INID1D = 8'h18;
parameter	INID2D = 8'h18;
parameter	INID3D = 8'h18;
parameter	INID4D = 8'h18;
parameter	INID5D = 8'h18;
parameter	INID6D = 8'h18;
parameter	INID7D = 8'h18;
parameter	INID8D = 8'h18;
parameter	INID9D = 8'h18;
parameter	INIDAD = 8'h18;
parameter	INIDBD = 8'h18;
parameter	INIDCD = 8'h18;
parameter	INIDDD = 8'h18;
parameter	INIDED = 8'h18;
parameter	INIDFD = 8'h18;
parameter	INIE0D = 8'h18;
parameter	INIE1D = 8'h18;
parameter	INIE2D = 8'h18;
parameter	INIE3D = 8'h18;
parameter	INIE4D = 8'h18;
parameter	INIE5D = 8'h18;
parameter	INIE6D = 8'h18;
parameter	INIE7D = 8'h18;
parameter	INIE8D = 8'h18; // ...
parameter	INIE9D = 8'h18; // INPUT PAD
parameter	INIEAD = 8'h00;
parameter	INIEBD = 8'h00;
parameter	INIECD = 8'h00;
parameter	INIEDD = 8'h00;
parameter	INIEED = 8'h00;
parameter	INIEFD = 8'h00;
parameter	INIF0D = 8'h00;
parameter	INIF1D = 8'h00;
parameter	INIF2D = 8'h00;
parameter	INIF3D = 8'h00;
parameter	INIF4D = 8'h00;
parameter	INIF5D = 8'h00;
parameter	INIF6D = 8'h00;
parameter	INIF7D = 8'h00;
parameter	INIF8D = 8'h00;
parameter	INIF9D = 8'h00;
parameter	INIFAD = 8'h00;
parameter	INIFBD = 8'h00;
parameter	INIFCD = 8'h00;
parameter	INIFDD = 8'h00;
parameter	INIFED = 8'h00;
parameter	INIFFD = 8'h00;
`else
parameter	INI00D = 8'h00;
parameter	INI01D = 8'h01;
parameter	INI02D = 8'h02;
parameter	INI03D = 8'h03;
parameter	INI04D = 8'h04;
parameter	INI05D = 8'h05;
parameter	INI06D = 8'h06;
parameter	INI07D = 8'h07;
parameter	INI08D = 8'h08;
parameter	INI09D = 8'h09;
parameter	INI0AD = 8'h0A;
parameter	INI0BD = 8'h0B;
parameter	INI0CD = 8'h0C;
parameter	INI0DD = 8'h0D;
parameter	INI0ED = 8'h0E;
parameter	INI0FD = 8'h0F;
parameter	INI10D = 8'h10;
parameter	INI11D = 8'h11;
parameter	INI12D = 8'h12;
parameter	INI13D = 8'h13;
parameter	INI14D = 8'h14;
parameter	INI15D = 8'h15;
parameter	INI16D = 8'h16;
parameter	INI17D = 8'h17;
parameter	INI18D = 8'h18;
parameter	INI19D = 8'h19;
parameter	INI1AD = 8'h1A;
parameter	INI1BD = 8'h1B;
parameter	INI1CD = 8'h1C;
parameter	INI1DD = 8'h1D;
parameter	INI1ED = 8'h1E;
parameter	INI1FD = 8'h1F;
parameter	INI20D = 8'h20;
parameter	INI21D = 8'h21;
parameter	INI22D = 8'h22;
parameter	INI23D = 8'h23;
parameter	INI24D = 8'h24;
parameter	INI25D = 8'h25;
parameter	INI26D = 8'h26;
parameter	INI27D = 8'h27;
parameter	INI28D = 8'h28;
parameter	INI29D = 8'h29;
parameter	INI2AD = 8'h2A;
parameter	INI2BD = 8'h2B;
parameter	INI2CD = 8'h2C;
parameter	INI2DD = 8'h2D;
parameter	INI2ED = 8'h2E;
parameter	INI2FD = 8'h2F;
parameter	INI30D = 8'h30;
parameter	INI31D = 8'h31;
parameter	INI32D = 8'h32;
parameter	INI33D = 8'h33;
parameter	INI34D = 8'h34;
parameter	INI35D = 8'h35;
parameter	INI36D = 8'h36;
parameter	INI37D = 8'h37;
parameter	INI38D = 8'h38;
parameter	INI39D = 8'h39;
parameter	INI3AD = 8'h3A;
parameter	INI3BD = 8'h3B;
parameter	INI3CD = 8'h3C;
parameter	INI3DD = 8'h3D;
parameter	INI3ED = 8'h3E;
parameter	INI3FD = 8'h3F;
parameter	INI40D = 8'h40;
parameter	INI41D = 8'h41;
parameter	INI42D = 8'h42;
parameter	INI43D = 8'h43;
parameter	INI44D = 8'h44;
parameter	INI45D = 8'h45;
parameter	INI46D = 8'h46;
parameter	INI47D = 8'h47;
parameter	INI48D = 8'h48;
parameter	INI49D = 8'h49;
parameter	INI4AD = 8'h4A;
parameter	INI4BD = 8'h4B;
parameter	INI4CD = 8'h4C;
parameter	INI4DD = 8'h4D;
parameter	INI4ED = 8'h4E;
parameter	INI4FD = 8'h4F;
parameter	INI50D = 8'h50;
parameter	INI51D = 8'h51;
parameter	INI52D = 8'h52;
parameter	INI53D = 8'h53;
parameter	INI54D = 8'h54;
parameter	INI55D = 8'h55;
parameter	INI56D = 8'h56;
parameter	INI57D = 8'h57;
parameter	INI58D = 8'h58;
parameter	INI59D = 8'h59;
parameter	INI5AD = 8'h5A;
parameter	INI5BD = 8'h5B;
parameter	INI5CD = 8'h5C;
parameter	INI5DD = 8'h5D;
parameter	INI5ED = 8'h5E;
parameter	INI5FD = 8'h5F;
parameter	INI60D = 8'h60;
parameter	INI61D = 8'h61;
parameter	INI62D = 8'h62;
parameter	INI63D = 8'h63;
parameter	INI64D = 8'h64;
parameter	INI65D = 8'h65;
parameter	INI66D = 8'h66;
parameter	INI67D = 8'h67;
parameter	INI68D = 8'h68;
parameter	INI69D = 8'h69;
parameter	INI6AD = 8'h6A;
parameter	INI6BD = 8'h6B;
parameter	INI6CD = 8'h6C;
parameter	INI6DD = 8'h6D;
parameter	INI6ED = 8'h6E;
parameter	INI6FD = 8'h6F;
parameter	INI70D = 8'h70;
parameter	INI71D = 8'h71;
parameter	INI72D = 8'h72;
parameter	INI73D = 8'h73;
parameter	INI74D = 8'h74;
parameter	INI75D = 8'h75;
parameter	INI76D = 8'h76;
parameter	INI77D = 8'h77;
parameter	INI78D = 8'h78;
parameter	INI79D = 8'h79;
parameter	INI7AD = 8'h7A;
parameter	INI7BD = 8'h7B;
parameter	INI7CD = 8'h7C;
parameter	INI7DD = 8'h7D;
parameter	INI7ED = 8'h7E;
parameter	INI7FD = 8'h7F;
parameter	INI80D = 8'h80;
parameter	INI81D = 8'h81;
parameter	INI82D = 8'h82;
parameter	INI83D = 8'h83;
parameter	INI84D = 8'h84;
parameter	INI85D = 8'h85;
parameter	INI86D = 8'h86;
parameter	INI87D = 8'h87;
parameter	INI88D = 8'h88;
parameter	INI89D = 8'h89;
parameter	INI8AD = 8'h8A;
parameter	INI8BD = 8'h8B;
parameter	INI8CD = 8'h8C;
parameter	INI8DD = 8'h8D;
parameter	INI8ED = 8'h8E;
parameter	INI8FD = 8'h8F;
parameter	INI90D = 8'h90;
parameter	INI91D = 8'h91;
parameter	INI92D = 8'h92;
parameter	INI93D = 8'h93;
parameter	INI94D = 8'h94;
parameter	INI95D = 8'h95;
parameter	INI96D = 8'h96;
parameter	INI97D = 8'h97;
parameter	INI98D = 8'h98;
parameter	INI99D = 8'h99;
parameter	INI9AD = 8'h9A;
parameter	INI9BD = 8'h9B;
parameter	INI9CD = 8'h9C;
parameter	INI9DD = 8'h9D;
parameter	INI9ED = 8'h9E;
parameter	INI9FD = 8'h9F;
parameter	INIA0D = 8'hA0;
parameter	INIA1D = 8'hA1;
parameter	INIA2D = 8'hA2;
parameter	INIA3D = 8'hA3;
parameter	INIA4D = 8'hA4;
parameter	INIA5D = 8'hA5;
parameter	INIA6D = 8'hA6;
parameter	INIA7D = 8'hA7;
parameter	INIA8D = 8'hA8;
parameter	INIA9D = 8'hA9;
parameter	INIAAD = 8'hAA;
parameter	INIABD = 8'hAB;
parameter	INIACD = 8'hAC;
parameter	INIADD = 8'hAD;
parameter	INIAED = 8'hAE;
parameter	INIAFD = 8'hAF;
parameter	INIB0D = 8'hB0;
parameter	INIB1D = 8'hB1;
parameter	INIB2D = 8'hB2;
parameter	INIB3D = 8'hB3;
parameter	INIB4D = 8'hB4;
parameter	INIB5D = 8'hB5;
parameter	INIB6D = 8'hB6;
parameter	INIB7D = 8'hB7;
parameter	INIB8D = 8'hB8;
parameter	INIB9D = 8'hB9;
parameter	INIBAD = 8'hBA;
parameter	INIBBD = 8'hBB;
parameter	INIBCD = 8'hBC;
parameter	INIBDD = 8'hBD;
parameter	INIBED = 8'hBE;
parameter	INIBFD = 8'hBF;
parameter	INIC0D = 8'hC0;
parameter	INIC1D = 8'hC1;
parameter	INIC2D = 8'hC2;
parameter	INIC3D = 8'hC3;
parameter	INIC4D = 8'hC4;
parameter	INIC5D = 8'hC5;
parameter	INIC6D = 8'hC6;
parameter	INIC7D = 8'hC7;
parameter	INIC8D = 8'hC8;
parameter	INIC9D = 8'hC9;
parameter	INICAD = 8'hCA;
parameter	INICBD = 8'hCB;
parameter	INICCD = 8'hCC;
parameter	INICDD = 8'hCD;
parameter	INICED = 8'hCE;
parameter	INICFD = 8'hCF;
parameter	INID0D = 8'hD0;
parameter	INID1D = 8'hD1;
parameter	INID2D = 8'hD2;
parameter	INID3D = 8'hD3;
parameter	INID4D = 8'hD4;
parameter	INID5D = 8'hD5;
parameter	INID6D = 8'hD6;
parameter	INID7D = 8'hD7;
parameter	INID8D = 8'hD8;
parameter	INID9D = 8'hD9;
parameter	INIDAD = 8'hDA;
parameter	INIDBD = 8'hDB;
parameter	INIDCD = 8'hDC;
parameter	INIDDD = 8'hDD;
parameter	INIDED = 8'hDE;
parameter	INIDFD = 8'hDF;
parameter	INIE0D = 8'hE0;
parameter	INIE1D = 8'hE1;
parameter	INIE2D = 8'hE2;
parameter	INIE3D = 8'hE3;
parameter	INIE4D = 8'hE4;
parameter	INIE5D = 8'hE5;
parameter	INIE6D = 8'hE6;
parameter	INIE7D = 8'hE7;
parameter	INIE8D = 8'hE8;
parameter	INIE9D = 8'hE9;
parameter	INIEAD = 8'hEA;
parameter	INIEBD = 8'hEB;
parameter	INIECD = 8'hEC;
parameter	INIEDD = 8'hED;
parameter	INIEED = 8'hEE;
parameter	INIEFD = 8'hEF;
parameter	INIF0D = 8'hF0;
parameter	INIF1D = 8'hF1;
parameter	INIF2D = 8'hF2;
parameter	INIF3D = 8'hF3;
parameter	INIF4D = 8'hF4;
parameter	INIF5D = 8'hF5;
parameter	INIF6D = 8'hF6;
parameter	INIF7D = 8'hF7;
parameter	INIF8D = 8'hF8;
parameter	INIF9D = 8'hF9;
parameter	INIFAD = 8'hFA;
parameter	INIFBD = 8'hFB;
parameter	INIFCD = 8'hFC;
parameter	INIFDD = 8'hFD;
parameter	INIFED = 8'hFE;
parameter	INIFFD = 8'hFF;
`endif

parameter DB_0    = 3'b100,	// State 0
	  DB_021  = 3'b101,	// 0 -> 1
	  DB_120  = 3'b110,	// 1 -> 0
	  DB_1    = 3'b111;	// State 1
reg [2:0]	isda_cs, isck_cs;
parameter SDA_TOP = 4'h2;	// Consecutive constant number
parameter SCK_TOP = 4'h2;	// Consecutive constant number
reg [3:0]	isda_cnt, isck_cnt;	// Consecutive constant value counter
reg [2:0]	isda_syn, isck_syn;	// meta-stability SCK/SDA
wire		sdai, scki;
reg		sdain, sckin;	// Debounce SDA/SCK

parameter I2C_IDLE = 4'h0,
	  I2C_STR  = 4'h1,
	  I2C_ADR  = 4'h2,
	  I2C_ACK  = 4'h3,	// I2C Address ACK
	  I2C_RADR = 4'h4,	// Register Address phase
	  I2C_ACK2 = 4'h5,	// Register Address ACK
	  I2C_WD   = 4'h6,
	  I2C_RD   = 4'h7,
	  I2C_DACK = 4'h8;	// Register Data ACK
reg [3:0] i2c_cs, i2c_ns;
reg [29:0] long_cnt;	// For timeout
wire		sstr;	// Signal START
wire		sstp;	// Signal STOP
wire		sclkr;	// Signal SCK rising
wire		sclkf;	// Signal SCK falling
reg	[2:0]	bit_cnt;	// bit counter
reg	[2:0]	bit_cnt_dly;	// bit counter
reg		bit_dat_lat;	// Bit data latch pulse
reg		dev_adr_lat;	// Device address latch pulse
reg		reg_adr_lat;	// Register address latch pulse
reg		reg_dat_lat;	// Register write in data latch pulse
reg		mult_ph;	// Write/Read multiple flag
reg		mult_ph_prog;	// Multiple in progress
wire		read_ph;	// Phase : 0: Write, 1: Read
reg		reg_adr_add;	// Register address auto add
reg		ireg_acs_pul;	// Internal register access pulse
reg		ireg_access;
reg	[3:0]	read_byte_cnt;	// Count the current read byte from I2C master
wire		read_mult;	// Enable read multiple
wire	[3:0]	read_mult_byte;	// Multiple read bytes

// internal registers
reg	[7:0]	dev_adr;	// dev_adr[0], 1: read out data phase
reg	[7:0]	reg_adr;	// regisrer address
reg	[7:0]	reg_wdata;	// write in data
reg	[7:0]	reg_rdata;	// read out data

//reg	[7:0]	mem_data[5:0];	// 64 * 8 = 512 bits memory space

// SCK, SDA signal re-sync to internal clock domain
assign	sdai = isda_syn[2];
assign	scki = isck_syn[2];

always @(posedge clk or negedge rstn)
if (!rstn)	begin isda_cs <= DB_1; isck_cs <= DB_1;	
	isda_syn <= 3'h7; isck_syn <= 3'h7;
	sdain <= 1'b1;	sckin <= 1'b1;
	isda_cnt <= 4'h0; isck_cnt <= 4'h0;	end
else begin
isda_syn <= {isda_syn[1:0], isda};
isck_syn <= {isck_syn[1:0], isck};
case (isda_cs)
DB_0  : begin sdain <= 1'b0;
	if (sdai) begin isda_cs <= DB_021; isda_cnt <= 4'h0; end
	end
DB_021: begin sdain <= 1'b0;
	if (sdai) begin
	  if (isda_cnt==SDA_TOP) begin isda_cs <= DB_1; end
	  else begin isda_cnt <= isda_cnt + 4'h1; end	end
	else begin isda_cs <= DB_0; end
	end
DB_1  : begin sdain <= 1'b1;
	if (!sdai) begin isda_cs <= DB_120; isda_cnt <= 4'h0; end
	end
DB_120: begin sdain <= 1'b1;
	if (sdai) isda_cs <= DB_1;
	else begin
	  if (isda_cnt==SDA_TOP) begin isda_cs <= DB_0; end
	  else begin isda_cnt <= isda_cnt + 4'h1; end
	end
	end
endcase
case (isck_cs)
DB_0  : begin sckin <= 1'b0;
	if (scki) begin isck_cs <= DB_021; isck_cnt <= 4'h0; end
	end
DB_021: begin sckin <= 1'b0;
	if (scki) begin
	  if (isck_cnt==SDA_TOP) begin isck_cs <= DB_1; end
	  else begin isck_cnt <= isck_cnt + 4'h1; end	end
	else begin isck_cs <= DB_0; end
	end
DB_1  : begin sckin <= 1'b1;
	if (!scki) begin isck_cs <= DB_120; isck_cnt <= 4'h0; end
	end
DB_120: begin sckin <= 1'b1;
	if (scki) isck_cs <= DB_1;
	else begin
	  if (isck_cnt==SDA_TOP) begin isck_cs <= DB_0; end
	  else begin isck_cnt <= isck_cnt + 4'h1; end
	end
	end
endcase
end

reg	sda_dly, sck_dly;
always @(posedge clk or negedge rstn)
if	(!rstn) begin	sda_dly <= 1'b1; sck_dly <= 1'b1;	end
else  begin sda_dly <= sdain; sck_dly <= sckin;	end

assign	sstr = sda_dly && sck_dly && !sdain;	// START event
assign	sstp = !sda_dly && sck_dly && sdain;	// STOP event
assign	sclkr = !sck_dly && sckin;		// Data latch event and counter proceed
assign	sclkf = sck_dly && !sckin;		// Data latch event and counter proceed

// I2C protocol handling
always @(posedge clk or negedge rstn) begin
if (!rstn)	begin i2c_cs <= I2C_IDLE; ireg_access <= 1'b0; ireg_acs_pul <= 1'b0; end
else if (sstp)	begin i2c_cs <= I2C_IDLE; 
		mult_ph_prog <= mult_ph;	end
else if (sstr)	begin	i2c_cs <= I2C_STR; end		// Prevent dead lock
else begin
i2c_ns <= i2c_cs;
bit_dat_lat <= 1'b0;
dev_adr_lat <= 1'b0;
reg_adr_lat <= 1'b0;
reg_dat_lat <= 1'b0;
reg_adr_add <= 1'b0;
ireg_acs_pul<= 1'b0;
bit_cnt_dly <= bit_cnt;
ireg_access <= ireg_acs_pul;
case (i2c_cs)
I2C_IDLE : begin
	if (sstr) i2c_cs <= I2C_STR;
	else if (sclkf && mult_ph_prog) begin
	  reg_adr_add <= 1'b1;
	  if (read_ph)	i2c_cs <= I2C_RD;
	  else	begin	i2c_cs <= I2C_WD;	end	
	end
	end
I2C_STR	 : begin
	  read_byte_cnt <= 4'h0;
	  bit_cnt <= 3'h7;
	  mult_ph <= 1'b0;
	  mult_ph_prog <= 1'b0;
	if (sstp) i2c_cs <= I2C_IDLE;
	else if (!sckin)	i2c_cs <= I2C_ADR;
	end
I2C_ADR	 : if (sclkr) begin
	  read_byte_cnt <= 4'h0;
	  mult_ph <= 1'b0;
	  bit_cnt <= bit_cnt + 3'h7;
	  bit_dat_lat <= 1'b1;
	  if (~|bit_cnt)	begin
	    dev_adr_lat <= 1'b1;	i2c_cs <= I2C_ACK;	end
	end
I2C_ACK	 : if (sclkr) begin
	  bit_cnt <= 3'h7;
	  if (read_ph) begin
	    i2c_cs <= I2C_RD;
	    ireg_acs_pul <= 1'b1;
	  end
	  else	begin i2c_cs <= I2C_RADR; end
	end
I2C_RADR : if (sclkr) begin
	  bit_cnt <= bit_cnt + 3'h7;
	  bit_dat_lat <= 1'b1;
	  if (~|bit_cnt)	begin
	    reg_adr_lat <= 1'b1;	i2c_cs <= I2C_ACK2;	end
	end
I2C_ACK2 : if (sclkr) begin
	  bit_cnt <= 3'h7;
	  i2c_cs <= I2C_WD;
	end
I2C_WD	 : if (sclkr) begin
	  mult_ph <= 1'b1;
	  bit_cnt <= bit_cnt + 3'h7;
	  bit_dat_lat <= 1'b1;
	  if (~|bit_cnt)	begin
	    reg_dat_lat <= 1'b1;
	    ireg_acs_pul <= 1'b1;
	   if (mult_ph_prog)	i2c_cs <= I2C_DACK;
	   else begin		i2c_cs <= I2C_IDLE;	end
	  end
	end
I2C_RD	 : if (sclkr) begin
	  mult_ph <= 1'b1;
	  bit_cnt <= bit_cnt + 3'h7;
	  bit_dat_lat <= 1'b1;
	  if (~|bit_cnt)	begin
	    reg_dat_lat <= 1'b1;
	   if (mult_ph_prog)	begin
		i2c_cs <= I2C_DACK;
		read_byte_cnt <= read_byte_cnt + 4'h1;
	   end
	   else begin		i2c_cs <= I2C_IDLE;	end
	  end
	end
I2C_DACK : if (sclkr) begin
	  reg_adr_add <= 1'b1;
	  if (read_ph) begin
	    i2c_cs <= I2C_RD;
	    ireg_acs_pul <= 1'b1;
	  end
	  else begin	i2c_cs <= I2C_WD;	end 
	end
endcase
end
end

always @(posedge clk or negedge rstn) begin
if (!rstn)	osda <= 1'b1;
else if (sclkf) begin
case (i2c_cs)
default : osda <= 1'b1;
I2C_ACK : if (I_DEV_ADR==dev_adr[7:1])	osda <= 1'b0;
I2C_ACK2: osda <= 1'b0;
I2C_DACK: if (read_ph) begin osda <= !read_mult || (read_byte_cnt==read_mult_byte); end
	else		osda <= 1'b0;
I2C_RD  : begin
	case (bit_cnt)
	3'h0	: osda <= reg_rdata[0];
	3'h1	: osda <= reg_rdata[1];
	3'h2	: osda <= reg_rdata[2];
	3'h3	: osda <= reg_rdata[3];
	3'h4	: osda <= reg_rdata[4];
	3'h5	: osda <= reg_rdata[5];
	3'h6	: osda <= reg_rdata[6];
	3'h7	: osda <= reg_rdata[7];
	endcase
	end
endcase
end
end

// Internal register read/write handling
assign	read_ph = dev_adr[0];
always @(posedge clk or negedge rstn) begin
if (!rstn)	begin	end
else begin
  if (i2c_ns==I2C_ADR) begin
    if (dev_adr_lat) dev_adr <= {dev_adr[7:1], sdain};
    else if (bit_dat_lat) begin
      case (bit_cnt_dly)
      default	: dev_adr[1] <= sdain;
      3'h2	: dev_adr[2] <= sdain;
      3'h3	: dev_adr[3] <= sdain;
      3'h4	: dev_adr[4] <= sdain;
      3'h5	: dev_adr[5] <= sdain;
      3'h6	: dev_adr[6] <= sdain;
      3'h7	: dev_adr[7] <= sdain;
      endcase
    end
  end

  if (i2c_ns==I2C_RADR) begin
    if (reg_adr_lat) reg_adr <= {reg_adr[7:1], sdain};
    else if (bit_dat_lat) begin
      case (bit_cnt_dly)
      default	: reg_adr[1] <= sdain;
      3'h2	: reg_adr[2] <= sdain;
      3'h3	: reg_adr[3] <= sdain;
      3'h4	: reg_adr[4] <= sdain;
      3'h5	: reg_adr[5] <= sdain;
      3'h6	: reg_adr[6] <= sdain;
      3'h7	: reg_adr[7] <= sdain;
      endcase
    end
  end
  else if (reg_adr_add)	begin reg_adr <= reg_adr + 8'h1;	end

  if (i2c_ns==I2C_WD) begin
    if (reg_dat_lat) reg_wdata <= {reg_wdata[7:1], sdain};
    else if (bit_dat_lat) begin
      case (bit_cnt_dly)
      default	: reg_wdata[1] <= sdain;
      3'h2	: reg_wdata[2] <= sdain;
      3'h3	: reg_wdata[3] <= sdain;
      3'h4	: reg_wdata[4] <= sdain;
      3'h5	: reg_wdata[5] <= sdain;
      3'h6	: reg_wdata[6] <= sdain;
      3'h7	: reg_wdata[7] <= sdain;
      endcase
    end
  end
end
end

// FIFO
always @(posedge clk or negedge rstn) begin
if (!rstn)	begin
		reg00d <= INI00D; reg01d <= INI01D; reg02d <= INI02D; reg03d <= INI03D;
		reg04d <= INI04D; reg05d <= INI05D; reg06d <= INI06D; reg07d <= INI07D;
		reg08d <= INI08D; reg09d <= INI09D; reg0Ad <= INI0AD; reg0Bd <= INI0BD;
		reg0Cd <= INI0CD; reg0Dd <= INI0DD; reg0Ed <= INI0ED; reg0Fd <= INI0FD;
		reg10d <= INI10D; reg11d <= INI11D; reg12d <= INI12D; reg13d <= INI13D;
		reg14d <= INI14D; reg15d <= INI15D; reg16d <= INI16D; reg17d <= INI17D;
		reg18d <= INI18D; reg19d <= INI19D; reg1Ad <= INI1AD; reg1Bd <= INI1BD;
		reg1Cd <= INI1CD; reg1Dd <= INI1DD; reg1Ed <= INI1ED; reg1Fd <= INI1FD;
		reg20d <= INI20D; reg21d <= INI21D; reg22d <= INI22D; reg23d <= INI23D;
		reg24d <= INI24D; reg25d <= INI25D; reg26d <= INI26D; reg27d <= INI27D;
		reg28d <= INI28D; reg29d <= INI29D; reg2Ad <= INI2AD; reg2Bd <= INI2BD;
		reg2Cd <= INI2CD; reg2Dd <= INI2DD; reg2Ed <= INI2ED; reg2Fd <= INI2FD;
		reg30d <= INI30D; reg31d <= INI31D; reg32d <= INI32D; reg33d <= INI33D;
		reg34d <= INI34D; reg35d <= INI35D; reg36d <= INI36D; reg37d <= INI37D;
		reg38d <= INI38D; reg39d <= INI39D; reg3Ad <= INI3AD; reg3Bd <= INI3BD;
		reg3Cd <= INI3CD; reg3Dd <= INI3DD; reg3Ed <= INI3ED; reg3Fd <= INI3FD;
		reg40d <= INI40D; reg41d <= INI41D; reg42d <= INI42D; reg43d <= INI43D;
		reg44d <= INI44D; reg45d <= INI45D; reg46d <= INI46D; reg47d <= INI47D;
		reg48d <= INI48D; reg49d <= INI49D; reg4Ad <= INI4AD; reg4Bd <= INI4BD;
		reg4Cd <= INI4CD; reg4Dd <= INI4DD; reg4Ed <= INI4ED; reg4Fd <= INI4FD;
		reg50d <= INI50D; reg51d <= INI51D; reg52d <= INI52D; reg53d <= INI53D;
		reg54d <= INI54D; reg55d <= INI55D; reg56d <= INI56D; reg57d <= INI57D;
		reg58d <= INI58D; reg59d <= INI59D; reg5Ad <= INI5AD; reg5Bd <= INI5BD;
		reg5Cd <= INI5CD; reg5Dd <= INI5DD; reg5Ed <= INI5ED; reg5Fd <= INI5FD;
		reg60d <= INI60D; reg61d <= INI61D; reg62d <= INI62D; reg63d <= INI63D;
		reg64d <= INI64D; reg65d <= INI65D; reg66d <= INI66D; reg67d <= INI67D;
		reg68d <= INI68D; reg69d <= INI69D; reg6Ad <= INI6AD; reg6Bd <= INI6BD;
		reg6Cd <= INI6CD; reg6Dd <= INI6DD; reg6Ed <= INI6ED; reg6Fd <= INI6FD;
		reg70d <= INI70D; reg71d <= INI71D; reg72d <= INI72D; reg73d <= INI73D;
		reg74d <= INI74D; reg75d <= INI75D; reg76d <= INI76D; reg77d <= INI77D;
		reg78d <= INI78D; reg79d <= INI79D; reg7Ad <= INI7AD; reg7Bd <= INI7BD;
		reg7Cd <= INI7CD; reg7Dd <= INI7DD; reg7Ed <= INI7ED; reg7Fd <= INI7FD;
		reg80d <= INI80D; reg81d <= INI81D; reg82d <= INI82D; reg83d <= INI83D;
		reg84d <= INI84D; reg85d <= INI85D; reg86d <= INI86D; reg87d <= INI87D;
		reg88d <= INI88D; reg89d <= INI89D; reg8Ad <= INI8AD; reg8Bd <= INI8BD;
		reg8Cd <= INI8CD; reg8Dd <= INI8DD; reg8Ed <= INI8ED; reg8Fd <= INI8FD;
		reg90d <= INI90D; reg91d <= INI91D; reg92d <= INI92D; reg93d <= INI93D;
		reg94d <= INI94D; reg95d <= INI95D; reg96d <= INI96D; reg97d <= INI97D;
		reg98d <= INI98D; reg99d <= INI99D; reg9Ad <= INI9AD; reg9Bd <= INI9BD;
		reg9Cd <= INI9CD; reg9Dd <= INI9DD; reg9Ed <= INI9ED; reg9Fd <= INI9FD;
		regA0d <= INIA0D; regA1d <= INIA1D; regA2d <= INIA2D; regA3d <= INIA3D;
		regA4d <= INIA4D; regA5d <= INIA5D; regA6d <= INIA6D; regA7d <= INIA7D;
		regA8d <= INIA8D; regA9d <= INIA9D; regAAd <= INIAAD; regABd <= INIABD;
		regACd <= INIACD; regADd <= INIADD; regAEd <= INIAED; regAFd <= INIAFD;
		regB0d <= INIB0D; regB1d <= INIB1D; regB2d <= INIB2D; regB3d <= INIB3D;
		regB4d <= INIB4D; regB5d <= INIB5D; regB6d <= INIB6D; regB7d <= INIB7D;
		regB8d <= INIB8D; regB9d <= INIB9D; regBAd <= INIBAD; regBBd <= INIBBD;
		regBCd <= INIBCD; regBDd <= INIBDD; regBEd <= INIBED; regBFd <= INIBFD;
		regC0d <= INIC0D; regC1d <= INIC1D; regC2d <= INIC2D; regC3d <= INIC3D;
		regC4d <= INIC4D; regC5d <= INIC5D; regC6d <= INIC6D; regC7d <= INIC7D;
		regC8d <= INIC8D; regC9d <= INIC9D; regCAd <= INICAD; regCBd <= INICBD;
		regCCd <= INICCD; regCDd <= INICDD; regCEd <= INICED; regCFd <= INICFD;
		regD0d <= INID0D; regD1d <= INID1D; regD2d <= INID2D; regD3d <= INID3D;
		regD4d <= INID4D; regD5d <= INID5D; regD6d <= INID6D; regD7d <= INID7D;
		regD8d <= INID8D; regD9d <= INID9D; regDAd <= INIDAD; regDBd <= INIDBD;
		regDCd <= INIDCD; regDDd <= INIDDD; regDEd <= INIDED; regDFd <= INIDFD;
		regE0d <= INIE0D; regE1d <= INIE1D; regE2d <= INIE2D; regE3d <= INIE3D;
		regE4d <= INIE4D; regE5d <= INIE5D; regE6d <= INIE6D; regE7d <= INIE7D;
		regE8d <= INIE8D; regE9d <= INIE9D; regEAd <= INIEAD; regEBd <= INIEBD;
		regECd <= INIECD; regEDd <= INIEDD; regEEd <= INIEED; regEFd <= INIEFD;
		regF0d <= INIF0D; regF1d <= INIF1D; regF2d <= INIF2D; regF3d <= INIF3D;
		regF4d <= INIF4D; regF5d <= INIF5D; regF6d <= INIF6D; regF7d <= INIF7D;
		regF8d <= INIF8D; regF9d <= INIF9D; regFAd <= INIFAD; regFBd <= INIFBD;
		regFCd <= INIFCD; regFDd <= INIFDD; regFEd <= INIFED; regFFd <= INIFFD;
		end
else if (ireg_access) begin
  if (read_ph) begin
  case (reg_adr)
  8'h00	: reg_rdata <= reg00d;
  8'h01	: reg_rdata <= reg01d;
  8'h02	: reg_rdata <= ireg02d;
  8'h03	: reg_rdata <= ireg03d;
  8'h04	: reg_rdata <= ireg04d;
  8'h05	: reg_rdata <= ireg05d;
  8'h06	: reg_rdata <= ireg06d;
  8'h07	: reg_rdata <= ireg07d;
  8'h08	: reg_rdata <= ireg08d;
  8'h09	: reg_rdata <= ireg09d;
  8'h0A	: reg_rdata <= ireg0Ad;
  8'h0B	: reg_rdata <= ireg0Bd;
  8'h0C	: reg_rdata <= ireg0Cd;
  8'h0D	: reg_rdata <= ireg0Dd;
  8'h0E	: reg_rdata <= ireg0Ed;
  8'h0F	: reg_rdata <= ireg0Fd;
  8'h10	: reg_rdata <= ireg10d;
  8'h11	: reg_rdata <= ireg11d;
  8'h12	: reg_rdata <= ireg12d;
  8'h13	: reg_rdata <= ireg13d;
  8'h14	: reg_rdata <= ireg14d;
  8'h15	: reg_rdata <= ireg15d;
  8'h16	: reg_rdata <= ireg16d;
  8'h17	: reg_rdata <= ireg17d;
  8'h18	: reg_rdata <= ireg18d;
  8'h19	: reg_rdata <= ireg19d;
  8'h1A	: reg_rdata <= ireg1Ad;
  8'h1B	: reg_rdata <= ireg1Bd;
  8'h1C	: reg_rdata <= ireg1Cd;
  8'h1D	: reg_rdata <= ireg1Dd;
  8'h1E	: reg_rdata <= ireg1Ed;
  8'h1F	: reg_rdata <= ireg1Fd;
  8'h20	: reg_rdata <= ireg20d;
  8'h21	: reg_rdata <= ireg21d;
  8'h22	: reg_rdata <= ireg22d;
  8'h23	: reg_rdata <= reg23d;
  8'h24	: reg_rdata <= reg24d;
  8'h25	: reg_rdata <= reg25d;
  8'h26	: reg_rdata <= reg26d;
  8'h27	: reg_rdata <= reg27d;
  8'h28	: reg_rdata <= reg28d;
  8'h29	: reg_rdata <= reg29d;
  8'h2A	: reg_rdata <= reg2Ad;
  8'h2B	: reg_rdata <= reg2Bd;
  8'h2C	: reg_rdata <= reg2Cd;
  8'h2D	: reg_rdata <= reg2Dd;
  8'h2E	: reg_rdata <= reg2Ed;
  8'h2F	: reg_rdata <= reg2Fd;
  8'h30	: reg_rdata <= reg30d;
  8'h31	: reg_rdata <= reg31d;
  8'h32	: reg_rdata <= reg32d;
  8'h33	: reg_rdata <= reg33d;
  8'h34	: reg_rdata <= reg34d;
  8'h35	: reg_rdata <= reg35d;
  8'h36	: reg_rdata <= reg36d;
  8'h37	: reg_rdata <= reg37d;
  8'h38	: reg_rdata <= reg38d;
  8'h39	: reg_rdata <= reg39d;
  8'h3A	: reg_rdata <= reg3Ad;
  8'h3B	: reg_rdata <= reg3Bd;
  8'h3C	: reg_rdata <= reg3Cd;
  8'h3D	: reg_rdata <= reg3Dd;
  8'h3E	: reg_rdata <= reg3Ed;
  8'h3F	: reg_rdata <= reg3Fd;
  8'h40	: reg_rdata <= reg40d;
  8'h41	: reg_rdata <= reg41d;
  8'h42	: reg_rdata <= reg42d;
  8'h43	: reg_rdata <= reg43d;
  8'h44	: reg_rdata <= reg44d;
  8'h45	: reg_rdata <= reg45d;
  8'h46	: reg_rdata <= reg46d;
  8'h47	: reg_rdata <= reg47d;
  8'h48	: reg_rdata <= reg48d;
  8'h49	: reg_rdata <= reg49d;
  8'h4A	: reg_rdata <= reg4Ad;
  8'h4B	: reg_rdata <= reg4Bd;
  8'h4C	: reg_rdata <= reg4Cd;
  8'h4D	: reg_rdata <= reg4Dd;
  8'h4E	: reg_rdata <= reg4Ed;
  8'h4F	: reg_rdata <= reg4Fd;
  8'h50	: reg_rdata <= reg50d;
  8'h51	: reg_rdata <= reg51d;
  8'h52	: reg_rdata <= reg52d;
  8'h53	: reg_rdata <= reg53d;
  8'h54	: reg_rdata <= reg54d;
  8'h55	: reg_rdata <= reg55d;
  8'h56	: reg_rdata <= reg56d;
  8'h57	: reg_rdata <= reg57d;
  8'h58	: reg_rdata <= reg58d;
  8'h59	: reg_rdata <= reg59d;
  8'h5A	: reg_rdata <= reg5Ad;
  8'h5B	: reg_rdata <= reg5Bd;
  8'h5C	: reg_rdata <= reg5Cd;
  8'h5D	: reg_rdata <= reg5Dd;
  8'h5E	: reg_rdata <= reg5Ed;
  8'h5F	: reg_rdata <= reg5Fd;
  8'h60	: reg_rdata <= reg60d;
  8'h61	: reg_rdata <= reg61d;
  8'h62	: reg_rdata <= reg62d;
  8'h63	: reg_rdata <= reg63d;
  8'h64	: reg_rdata <= reg64d;
  8'h65	: reg_rdata <= reg65d;
  8'h66	: reg_rdata <= reg66d;
  8'h67	: reg_rdata <= reg67d;
  8'h68	: reg_rdata <= reg68d;
  8'h69	: reg_rdata <= reg69d;
  8'h6A	: reg_rdata <= reg6Ad;
  8'h6B	: reg_rdata <= reg6Bd;
  8'h6C	: reg_rdata <= reg6Cd;
  8'h6D	: reg_rdata <= reg6Dd;
  8'h6E	: reg_rdata <= reg6Ed;
  8'h6F	: reg_rdata <= reg6Fd;
  8'h70	: reg_rdata <= reg70d;
  8'h71	: reg_rdata <= reg71d;
  8'h72	: reg_rdata <= reg72d;
  8'h73	: reg_rdata <= reg73d;
  8'h74	: reg_rdata <= reg74d;
  8'h75	: reg_rdata <= reg75d;
  8'h76	: reg_rdata <= reg76d;
  8'h77	: reg_rdata <= reg77d;
  8'h78	: reg_rdata <= reg78d;
  8'h79	: reg_rdata <= reg79d;
  8'h7A	: reg_rdata <= reg7Ad;
  8'h7B	: reg_rdata <= reg7Bd;
  8'h7C	: reg_rdata <= reg7Cd;
  8'h7D	: reg_rdata <= reg7Dd;
  8'h7E	: reg_rdata <= reg7Ed;
  8'h7F	: reg_rdata <= reg7Fd;
  8'h80	: reg_rdata <= reg80d;
  8'h81	: reg_rdata <= reg81d;
  8'h82	: reg_rdata <= reg82d;
  8'h83	: reg_rdata <= reg83d;
  8'h84	: reg_rdata <= reg84d;
  8'h85	: reg_rdata <= reg85d;
  8'h86	: reg_rdata <= reg86d;
  8'h87	: reg_rdata <= reg87d;
  8'h88	: reg_rdata <= reg88d;
  8'h89	: reg_rdata <= reg89d;
  8'h8A	: reg_rdata <= reg8Ad;
  8'h8B	: reg_rdata <= reg8Bd;
  8'h8C	: reg_rdata <= reg8Cd;
  8'h8D	: reg_rdata <= reg8Dd;
  8'h8E	: reg_rdata <= reg8Ed;
  8'h8F	: reg_rdata <= reg8Fd;
  8'h90	: reg_rdata <= reg90d;
  8'h91	: reg_rdata <= reg91d;
  8'h92	: reg_rdata <= reg92d;
  8'h93	: reg_rdata <= reg93d;
  8'h94	: reg_rdata <= reg94d;
  8'h95	: reg_rdata <= reg95d;
  8'h96	: reg_rdata <= reg96d;
  8'h97	: reg_rdata <= reg97d;
  8'h98	: reg_rdata <= reg98d;
  8'h99	: reg_rdata <= reg99d;
  8'h9A	: reg_rdata <= reg9Ad;
  8'h9B	: reg_rdata <= reg9Bd;
  8'h9C	: reg_rdata <= reg9Cd;
  8'h9D	: reg_rdata <= reg9Dd;
  8'h9E	: reg_rdata <= reg9Ed;
  8'h9F	: reg_rdata <= reg9Fd;
  8'hA0	: reg_rdata <= regA0d;
  8'hA1	: reg_rdata <= regA1d;
  8'hA2	: reg_rdata <= regA2d;
  8'hA3	: reg_rdata <= regA3d;
  8'hA4	: reg_rdata <= regA4d;
  8'hA5	: reg_rdata <= regA5d;
  8'hA6	: reg_rdata <= regA6d;
  8'hA7	: reg_rdata <= regA7d;
  8'hA8	: reg_rdata <= regA8d;
  8'hA9	: reg_rdata <= regA9d;
  8'hAA	: reg_rdata <= regAAd;
  8'hAB	: reg_rdata <= regABd;
  8'hAC	: reg_rdata <= regACd;
  8'hAD	: reg_rdata <= regADd;
  8'hAE	: reg_rdata <= regAEd;
  8'hAF	: reg_rdata <= regAFd;
  8'hB0	: reg_rdata <= regB0d;
  8'hB1	: reg_rdata <= regB1d;
  8'hB2	: reg_rdata <= regB2d;
  8'hB3	: reg_rdata <= regB3d;
  8'hB4	: reg_rdata <= regB4d;
  8'hB5	: reg_rdata <= regB5d;
  8'hB6	: reg_rdata <= regB6d;
  8'hB7	: reg_rdata <= regB7d;
  8'hB8	: reg_rdata <= regB8d;
  8'hB9	: reg_rdata <= regB9d;
  8'hBA	: reg_rdata <= regBAd;
  8'hBB	: reg_rdata <= regBBd;
  8'hBC	: reg_rdata <= regBCd;
  8'hBD	: reg_rdata <= regBDd;
  8'hBE	: reg_rdata <= regBEd;
  8'hBF	: reg_rdata <= regBFd;
  8'hC0	: reg_rdata <= regC0d;
  8'hC1	: reg_rdata <= regC1d;
  8'hC2	: reg_rdata <= regC2d;
  8'hC3	: reg_rdata <= regC3d;
  8'hC4	: reg_rdata <= regC4d;
  8'hC5	: reg_rdata <= regC5d;
  8'hC6	: reg_rdata <= regC6d;
  8'hC7	: reg_rdata <= regC7d;
  8'hC8	: reg_rdata <= regC8d;
  8'hC9	: reg_rdata <= regC9d;
  8'hCA	: reg_rdata <= regCAd;
  8'hCB	: reg_rdata <= regCBd;
  8'hCC	: reg_rdata <= regCCd;
  8'hCD	: reg_rdata <= regCDd;
  8'hCE	: reg_rdata <= regCEd;
  8'hCF	: reg_rdata <= regCFd;
  8'hD0	: reg_rdata <= regD0d;
  8'hD1	: reg_rdata <= regD1d;
  8'hD2	: reg_rdata <= regD2d;
  8'hD3	: reg_rdata <= regD3d;
  8'hD4	: reg_rdata <= regD4d;
  8'hD5	: reg_rdata <= regD5d;
  8'hD6	: reg_rdata <= regD6d;
  8'hD7	: reg_rdata <= regD7d;
  8'hD8	: reg_rdata <= regD8d;
  8'hD9	: reg_rdata <= regD9d;
  8'hDA	: reg_rdata <= regDAd;
  8'hDB	: reg_rdata <= regDBd;
  8'hDC	: reg_rdata <= regDCd;
  8'hDD	: reg_rdata <= regDDd;
  8'hDE	: reg_rdata <= regDEd;
  8'hDF	: reg_rdata <= regDFd;
  8'hE0	: reg_rdata <= regE0d;
  8'hE1	: reg_rdata <= regE1d;
  8'hE2	: reg_rdata <= regE2d;
  8'hE3	: reg_rdata <= regE3d;
  8'hE4	: reg_rdata <= regE4d;
  8'hE5	: reg_rdata <= regE5d;
  8'hE6	: reg_rdata <= regE6d;
  8'hE7	: reg_rdata <= regE7d;
  8'hE8	: reg_rdata <= regE8d;
  8'hE9	: reg_rdata <= regE9d;
  8'hEA	: reg_rdata <= regEAd;
  8'hEB	: reg_rdata <= regEBd;
  8'hEC	: reg_rdata <= regECd;
  8'hED	: reg_rdata <= regEDd;
  8'hEE	: reg_rdata <= regEEd;
  8'hEF	: reg_rdata <= regEFd;
  8'hF0	: reg_rdata <= regF0d;
  8'hF1	: reg_rdata <= regF1d;
  8'hF2	: reg_rdata <= regF2d;
  8'hF3	: reg_rdata <= regF3d;
  8'hF4	: reg_rdata <= regF4d;
  8'hF5	: reg_rdata <= regF5d;
  8'hF6	: reg_rdata <= regF6d;
  8'hF7	: reg_rdata <= regF7d;
  8'hF8	: reg_rdata <= regF8d;
  8'hF9	: reg_rdata <= regF9d;
  8'hFA	: reg_rdata <= regFAd;
  8'hFB	: reg_rdata <= regFBd;
  8'hFC	: reg_rdata <= regFCd;
  8'hFD	: reg_rdata <= regFDd;
  8'hFE	: reg_rdata <= regFEd;
  8'hFF	: reg_rdata <= regFFd;
  endcase
  end	// end of read_ph
  else begin
  case (reg_adr)
  8'h00	: reg00d <= reg_wdata;
  8'h01	: reg01d <= reg_wdata;
  8'h02	: reg02d <= reg_wdata;
  8'h03	: reg03d <= reg_wdata;
  8'h04	: reg04d <= reg_wdata;
  8'h05	: reg05d <= reg_wdata;
  8'h06	: reg06d <= reg_wdata;
  8'h07	: reg07d <= reg_wdata;
  8'h08	: reg08d <= reg_wdata;
  8'h09	: reg09d <= reg_wdata;
  8'h0A	: reg0Ad <= reg_wdata;
  8'h0B	: reg0Bd <= reg_wdata;
  8'h0C	: reg0Cd <= reg_wdata;
  8'h0D	: reg0Dd <= reg_wdata;
  8'h0E	: reg0Ed <= reg_wdata;
  8'h0F	: reg0Fd <= reg_wdata;
  8'h10	: reg10d <= reg_wdata;
  8'h11	: reg11d <= reg_wdata;
  8'h12	: reg12d <= reg_wdata;
  8'h13	: reg13d <= reg_wdata;
  8'h14	: reg14d <= reg_wdata;
  8'h15	: reg15d <= reg_wdata;
  8'h16	: reg16d <= reg_wdata;
  8'h17	: reg17d <= reg_wdata;
  8'h18	: reg18d <= reg_wdata;
  8'h19	: reg19d <= reg_wdata;
  8'h1A	: reg1Ad <= reg_wdata;
  8'h1B	: reg1Bd <= reg_wdata;
  8'h1C	: reg1Cd <= reg_wdata;
  8'h1D	: reg1Dd <= reg_wdata;
  8'h1E	: reg1Ed <= reg_wdata;
  8'h1F	: reg1Fd <= reg_wdata;
  8'h20	: reg20d <= reg_wdata;
  8'h21	: reg21d <= reg_wdata;
  8'h22	: reg22d <= reg_wdata;
  8'h23	: reg23d <= reg_wdata;
  8'h24	: reg24d <= reg_wdata;
  8'h25	: reg25d <= reg_wdata;
  8'h26	: reg26d <= reg_wdata;
  8'h27	: reg27d <= reg_wdata;
  8'h28	: reg28d <= reg_wdata;
  8'h29	: reg29d <= reg_wdata;
  8'h2A	: reg2Ad <= reg_wdata;
  8'h2B	: reg2Bd <= reg_wdata;
  8'h2C	: reg2Cd <= reg_wdata;
  8'h2D	: reg2Dd <= reg_wdata;
  8'h2E	: reg2Ed <= reg_wdata;
  8'h2F	: reg2Fd <= reg_wdata;
  8'h30	: reg30d <= reg_wdata;
  8'h31	: reg31d <= reg_wdata;
  8'h32	: reg32d <= reg_wdata;
  8'h33	: reg33d <= reg_wdata;
  8'h34	: reg34d <= reg_wdata;
  8'h35	: reg35d <= reg_wdata;
  8'h36	: reg36d <= reg_wdata;
  8'h37	: reg37d <= reg_wdata;
  8'h38	: reg38d <= reg_wdata;
  8'h39	: reg39d <= reg_wdata;
  8'h3A	: reg3Ad <= reg_wdata;
  8'h3B	: reg3Bd <= reg_wdata;
  8'h3C	: reg3Cd <= reg_wdata;
  8'h3D	: reg3Dd <= reg_wdata;
  8'h3E	: reg3Ed <= reg_wdata;
  8'h3F	: reg3Fd <= reg_wdata;
  8'h40	: reg40d <= reg_wdata;
  8'h41	: reg41d <= reg_wdata;
  8'h42	: reg42d <= reg_wdata;
  8'h43	: reg43d <= reg_wdata;
  8'h44	: reg44d <= reg_wdata;
  8'h45	: reg45d <= reg_wdata;
  8'h46	: reg46d <= reg_wdata;
  8'h47	: reg47d <= reg_wdata;
  8'h48	: reg48d <= reg_wdata;
  8'h49	: reg49d <= reg_wdata;
  8'h4A	: reg4Ad <= reg_wdata;
  8'h4B	: reg4Bd <= reg_wdata;
  8'h4C	: reg4Cd <= reg_wdata;
  8'h4D	: reg4Dd <= reg_wdata;
  8'h4E	: reg4Ed <= reg_wdata;
  8'h4F	: reg4Fd <= reg_wdata;
  8'h50	: reg50d <= reg_wdata;
  8'h51	: reg51d <= reg_wdata;
  8'h52	: reg52d <= reg_wdata;
  8'h53	: reg53d <= reg_wdata;
  8'h54	: reg54d <= reg_wdata;
  8'h55	: reg55d <= reg_wdata;
  8'h56	: reg56d <= reg_wdata;
  8'h57	: reg57d <= reg_wdata;
  8'h58	: reg58d <= reg_wdata;
  8'h59	: reg59d <= reg_wdata;
  8'h5A	: reg5Ad <= reg_wdata;
  8'h5B	: reg5Bd <= reg_wdata;
  8'h5C	: reg5Cd <= reg_wdata;
  8'h5D	: reg5Dd <= reg_wdata;
  8'h5E	: reg5Ed <= reg_wdata;
  8'h5F	: reg5Fd <= reg_wdata;
  8'h60	: reg60d <= reg_wdata;
  8'h61	: reg61d <= reg_wdata;
  8'h62	: reg62d <= reg_wdata;
  8'h63	: reg63d <= reg_wdata;
  8'h64	: reg64d <= reg_wdata;
  8'h65	: reg65d <= reg_wdata;
  8'h66	: reg66d <= reg_wdata;
  8'h67	: reg67d <= reg_wdata;
  8'h68	: reg68d <= reg_wdata;
  8'h69	: reg69d <= reg_wdata;
  8'h6A	: reg6Ad <= reg_wdata;
  8'h6B	: reg6Bd <= reg_wdata;
  8'h6C	: reg6Cd <= reg_wdata;
  8'h6D	: reg6Dd <= reg_wdata;
  8'h6E	: reg6Ed <= reg_wdata;
  8'h6F	: reg6Fd <= reg_wdata;
  8'h70	: reg70d <= reg_wdata;
  8'h71	: reg71d <= reg_wdata;
  8'h72	: reg72d <= reg_wdata;
  8'h73	: reg73d <= reg_wdata;
  8'h74	: reg74d <= reg_wdata;
  8'h75	: reg75d <= reg_wdata;
  8'h76	: reg76d <= reg_wdata;
  8'h77	: reg77d <= reg_wdata;
  8'h78	: reg78d <= reg_wdata;
  8'h79	: reg79d <= reg_wdata;
  8'h7A	: reg7Ad <= reg_wdata;
  8'h7B	: reg7Bd <= reg_wdata;
  8'h7C	: reg7Cd <= reg_wdata;
  8'h7D	: reg7Dd <= reg_wdata;
  8'h7E	: reg7Ed <= reg_wdata;
  8'h7F	: reg7Fd <= reg_wdata;
  8'h80	: reg80d <= reg_wdata;
  8'h81	: reg81d <= reg_wdata;
  8'h82	: reg82d <= reg_wdata;
  8'h83	: reg83d <= reg_wdata;
  8'h84	: reg84d <= reg_wdata;
  8'h85	: reg85d <= reg_wdata;
  8'h86	: reg86d <= reg_wdata;
  8'h87	: reg87d <= reg_wdata;
  8'h88	: reg88d <= reg_wdata;
  8'h89	: reg89d <= reg_wdata;
  8'h8A	: reg8Ad <= reg_wdata;
  8'h8B	: reg8Bd <= reg_wdata;
  8'h8C	: reg8Cd <= reg_wdata;
  8'h8D	: reg8Dd <= reg_wdata;
  8'h8E	: reg8Ed <= reg_wdata;
  8'h8F	: reg8Fd <= reg_wdata;
  8'h90	: reg90d <= reg_wdata;
  8'h91	: reg91d <= reg_wdata;
  8'h92	: reg92d <= reg_wdata;
  8'h93	: reg93d <= reg_wdata;
  8'h94	: reg94d <= reg_wdata;
  8'h95	: reg95d <= reg_wdata;
  8'h96	: reg96d <= reg_wdata;
  8'h97	: reg97d <= reg_wdata;
  8'h98	: reg98d <= reg_wdata;
  8'h99	: reg99d <= reg_wdata;
  8'h9A	: reg9Ad <= reg_wdata;
  8'h9B	: reg9Bd <= reg_wdata;
  8'h9C	: reg9Cd <= reg_wdata;
  8'h9D	: reg9Dd <= reg_wdata;
  8'h9E	: reg9Ed <= reg_wdata;
  8'h9F	: reg9Fd <= reg_wdata;
  8'hA0	: regA0d <= reg_wdata;
  8'hA1	: regA1d <= reg_wdata;
  8'hA2	: regA2d <= reg_wdata;
  8'hA3	: regA3d <= reg_wdata;
  8'hA4	: regA4d <= reg_wdata;
  8'hA5	: regA5d <= reg_wdata;
  8'hA6	: regA6d <= reg_wdata;
  8'hA7	: regA7d <= reg_wdata;
  8'hA8	: regA8d <= reg_wdata;
  8'hA9	: regA9d <= reg_wdata;
  8'hAA	: regAAd <= reg_wdata;
  8'hAB	: regABd <= reg_wdata;
  8'hAC	: regACd <= reg_wdata;
  8'hAD	: regADd <= reg_wdata;
  8'hAE	: regAEd <= reg_wdata;
  8'hAF	: regAFd <= reg_wdata;
  8'hB0	: regB0d <= reg_wdata;
  8'hB1	: regB1d <= reg_wdata;
  8'hB2	: regB2d <= reg_wdata;
  8'hB3	: regB3d <= reg_wdata;
  8'hB4	: regB4d <= reg_wdata;
  8'hB5	: regB5d <= reg_wdata;
  8'hB6	: regB6d <= reg_wdata;
  8'hB7	: regB7d <= reg_wdata;
  8'hB8	: regB8d <= reg_wdata;
  8'hB9	: regB9d <= reg_wdata;
  8'hBA	: regBAd <= reg_wdata;
  8'hBB	: regBBd <= reg_wdata;
  8'hBC	: regBCd <= reg_wdata;
  8'hBD	: regBDd <= reg_wdata;
  8'hBE	: regBEd <= reg_wdata;
  8'hBF	: regBFd <= reg_wdata;
  8'hC0	: regC0d <= reg_wdata;
  8'hC1	: regC1d <= reg_wdata;
  8'hC2	: regC2d <= reg_wdata;
  8'hC3	: regC3d <= reg_wdata;
  8'hC4	: regC4d <= reg_wdata;
  8'hC5	: regC5d <= reg_wdata;
  8'hC6	: regC6d <= reg_wdata;
  8'hC7	: regC7d <= reg_wdata;
  8'hC8	: regC8d <= reg_wdata;
  8'hC9	: regC9d <= reg_wdata;
  8'hCA	: regCAd <= reg_wdata;
  8'hCB	: regCBd <= reg_wdata;
  8'hCC	: regCCd <= reg_wdata;
  8'hCD	: regCDd <= reg_wdata;
  8'hCE	: regCEd <= reg_wdata;
  8'hCF	: regCFd <= reg_wdata;
  8'hD0	: regD0d <= reg_wdata;
  8'hD1	: regD1d <= reg_wdata;
  8'hD2	: regD2d <= reg_wdata;
  8'hD3	: regD3d <= reg_wdata;
  8'hD4	: regD4d <= reg_wdata;
  8'hD5	: regD5d <= reg_wdata;
  8'hD6	: regD6d <= reg_wdata;
  8'hD7	: regD7d <= reg_wdata;
  8'hD8	: regD8d <= reg_wdata;
  8'hD9	: regD9d <= reg_wdata;
  8'hDA	: regDAd <= reg_wdata;
  8'hDB	: regDBd <= reg_wdata;
  8'hDC	: regDCd <= reg_wdata;
  8'hDD	: regDDd <= reg_wdata;
  8'hDE	: regDEd <= reg_wdata;
  8'hDF	: regDFd <= reg_wdata;
  8'hE0	: regE0d <= reg_wdata;
  8'hE1	: regE1d <= reg_wdata;
  8'hE2	: regE2d <= reg_wdata;
  8'hE3	: regE3d <= reg_wdata;
  8'hE4	: regE4d <= reg_wdata;
  8'hE5	: regE5d <= reg_wdata;
  8'hE6	: regE6d <= reg_wdata;
  8'hE7	: regE7d <= reg_wdata;
  8'hE8	: regE8d <= reg_wdata;
  8'hE9	: regE9d <= reg_wdata;
  8'hEA	: regEAd <= reg_wdata;
  8'hEB	: regEBd <= reg_wdata;
  8'hEC	: regECd <= reg_wdata;
  8'hED	: regEDd <= reg_wdata;
  8'hEE	: regEEd <= reg_wdata;
  8'hEF	: regEFd <= reg_wdata;
  8'hF0	: regF0d <= reg_wdata;
  8'hF1	: regF1d <= reg_wdata;
  8'hF2	: regF2d <= reg_wdata;
  8'hF3	: regF3d <= reg_wdata;
  8'hF4	: regF4d <= reg_wdata;
  8'hF5	: regF5d <= reg_wdata;
  8'hF6	: regF6d <= reg_wdata;
  8'hF7	: regF7d <= reg_wdata;
  8'hF8	: regF8d <= reg_wdata;
  8'hF9	: regF9d <= reg_wdata;
  8'hFA	: regFAd <= reg_wdata;
  8'hFB	: regFBd <= reg_wdata;
  8'hFC	: regFCd <= reg_wdata;
  8'hFD	: regFDd <= reg_wdata;
  8'hFE	: regFEd <= reg_wdata;
  8'hFF	: regFFd <= reg_wdata;
  endcase
  end
  end	// end of ireg_access
end

assign	read_mult = regFFd[7];
assign	read_mult_byte = regFFd[3:0];

endmodule

/****************************************************************************
 * Physical constants and unit conversion
 *
 * License:
 *     $(LINK2 www.boost.org/LICENSE_1_0.txt, Boost License 1.0).
 *
 *
 * Standard:
 *     $(LINK2 https://physics.nist.gov/cuu/pdf/wallet_2022.pdf, CODATA 2022)
 *
 * Version:
 *     1.0
 *
 * Authors:
 *     ARAI Kohei
 *
 * Macros:
 *     SUB= <sub style="vertical-align:sub;font-size:80%">$0</sub>
 *     SUP= <sup style="vertical-align:super;font-size:80%">$0</sup>
 *
 ****************************************************************************/

module physics;

import std.traits: isFloatingPoint;

/****************************
 * Speed of light in vaccum $(I c)&thinsp;= 299,792,458.0 [m/s]
 ****************************/
enum real SPEED_OF_LIGHT= 0x1.1de784ap+28L;

/****************************
 * Planck constant $(I h)&thinsp;= 6.62607015×10$(SUP −34) [J/Hz]
 ****************************/
enum real PLANCK_CONST= 0x1.b860bde023111p-111L;	// [J⋅Hz^-1]

/****************************
 * Reduced Planck constant ℏ&thinsp;= 1.054571817×10$(SUP −34) [J⋅s]
 ****************************/
enum real REDUCED_PLANCK_CONST= () @safe pure nothrow @nogc{
	import std.math: M_1_PI;
	return PLANCK_CONST*M_1_PI/2;
}();

/****************************
 * Boltzmann constant $(I k)$(SUB B)&thinsp;= 1.380649×10$(SUP −23) [J/K]
 ****************************/
enum real BOLTZMANN_CONST= 0x1.0b0e6d55e647cp-76L;	// [J/K]

/****************************
 * Gravitational constant $(I G)&thinsp;= 6.67430×10$(SUP −11) [m$(SUP 3)/(kg⋅s$(SUP 2))]
 ****************************/
enum real GRAVITATIONAL_CONST= 0x1.2589effed8accp-34L;	// [m^3 kg^-1 s^-2]

/*
 * Cosmological constant &Lambda;= 1.089×10$(SUP −52) [m$(SUP -2]
 */
//enum real COSMOLOGICAL_CONST= 1.089E-52L;	// m^-2

/****************************
 * Stefan-Boltzman constant $(I &sigma;)&thinsp;= 5.670374…×10$(SUP −8) [W/(m$(SUP 2)⋅K$(SUP 4))]
 ****************************/
enum real STEFAN_BOLTZMANN_CONST= () @safe pure nothrow @nogc{
	import std.math: PI, pow;
	return pow(PI, 2)*pow(BOLTZMANN_CONST, 4)/(60*pow(REDUCED_PLANCK_CONST, 3)*pow(SPEED_OF_LIGHT, 2));
}();

/****************************
 * Elementary charge $(I e)&thinsp;= 1.602176634×10$(SUP −19) [C]
 ****************************/
enum real ELEMENTARY_CHARGE= 0x1.7a4da290c1653p-63L;

/****************************
 * Conductance quantum $(I G)$(SUB 0)&thinsp;= 7.78091729…×10$(SUP −5) [S]
 *
 * This quantum is not noted in CODATA 2022
 ****************************/
enum real CONDUCTANCE_QUANTUM= () @safe pure nothrow @nogc{
	import std.math: pow;
	return 2*pow(ELEMENTARY_CHARGE, 2)/PLANCK_CONST;
}();

/****************************
 * Von Klitzing constant $(I R)$(SUB K)&thinsp;= 25,812.807… [&Omega;]
 ****************************/
enum real VON_KLITZING_CONST= () @safe pure nothrow @nogc{
	import std.math: pow;
	return PLANCK_CONST/pow(ELEMENTARY_CHARGE, 2);
}();

/****************************
 * Josephson constant $(I K)$(SUB J)&thinsp;= 483,597.8484…×10$(SUP 9) [Hz/V]
 ****************************/
enum real JOSEPHSON_CONST= () @safe pure nothrow @nogc{
	return 2*ELEMENTARY_CHARGE/PLANCK_CONST;
}();

/****************************
 * Luminous efficacy $(I K)$(SUB cd)&thinsp;= 683 [lm/W]
 ****************************/
enum double LUMINOUS_EFFICACY= 0x1.558p+9;
;

/****************************
 * Magnetic flux quantum $(I &Phi;)$(SUB 0)&thinsp;= 2.067833848…×10$(SUP −15) [Wb]
 ****************************/
enum real MAGNETIC_FLUX_QUANTUM= () @safe pure nothrow @nogc{
	return 1/JOSEPHSON_CONST;
}();

/****************************
 * Vaccum magnetic permeability $(I &mu;)$(SUB 0)&thinsp;= 1.25663706127×10$(SUP −6) [N/A$(SUP 2)]
 ****************************/
enum real MAGNETIC_PERMEABILITY= 0x1.515370f8e0228c2p-20L;

/****************************
 * Vaccum electric permeability $(I &epsilon;)$(SUB 0)&thinsp;= 8.8541878188×10$(SUP −12) [F/m]
 ****************************/
enum real ELECTRIC_PERMEABILITY= 0x1.37876f159114fbe6p-37L;

/****************************
 * Fine-structure constant $(I &alpha;)&thinsp;= 7.297352…×10$(SUP −3) [-]
 ****************************/
enum real FINE_STRUCTURE_CONST= () @safe pure nothrow @nogc{
	import std.math: pow, PI;
	return pow(ELEMENTARY_CHARGE, 2)/(4*PI*ELECTRIC_PERMEABILITY*REDUCED_PLANCK_CONST*SPEED_OF_LIGHT);
}();

/****************************
 * Electron mass $(I m)$(SUB e)&thinsp;= 9.109383…×10$(SUP −31) [kg]
 ****************************/
enum real ELECTRON_MASS= 0x1.279dcc922bcd91aep-100L;

/****************************
 * Avogadro constant $(I N)$(SUB A)&thinsp;= 6.02214076…×10$(SUP 23) [mol$(SUP −1)]
 ****************************/
enum real AVOGADRO_CONST= 0x1.fe185ca57c517318p+78L;

/****************************
 * Molar gas constant $(I R)&thinsp;= 8.31446261815324 [J/(K⋅mol)]
 ****************************/
enum real MOLAR_GAS_CONST= () @safe pure nothrow @nogc{
	return AVOGADRO_CONST*BOLTZMANN_CONST;
}();

/****************************
 * Faraday constant $(I F)&thinsp;= 96,485.332123… [C/mol]
 ****************************/
enum real FARADAY_CONST= () @safe pure nothrow @nogc{
	return AVOGADRO_CONST*ELEMENTARY_CHARGE;
}();

/****************************
 * Molar Planck constant= 3.990312712…10$(SUP −10) [J⋅s/mol]
 ****************************/
enum real MOLAR_PLANCK_CONST= () @safe pure nothrow @nogc{
	return AVOGADRO_CONST*PLANCK_CONST;
}();



/****************************
 * Standard gravity $(I g)&thinsp;= 9.80665 [m/s$(SUP 2)]
 ****************************/
enum double STD_GRAVITY_ACC= 0x1.39d013a92a305p+3;	// [m/s^2]

/****************************
 * Standard atmosphere $(I p)$(SUB 0)&thinsp;= 101325.0 [Pa]
 ****************************/
enum double STD_ATMOSPHERE= 0x1.8bcdp+16;

/****************************
 * Gas constant of air $(I R)$(SUB d)&thinsp;= 287.0 [J/(kg⋅K)]
 ****************************/
enum double GAS_CONST_OF_AIR= 0x1.1fp+8;

/****************************
 * Zero degree Celsius= 273.15 [K]
 ****************************/
enum double ZERO_DEGREE_CELSIUS= 0x1.1126666666666p+8;



/****************************
 * Unit conversion from degrees to radians
 *
 * Params:
 *     angleDeg= angle in degrees
 *
 * Returns:
 *     angle in radians
 ****************************/
F degToRad(F)(in F angleDeg) @safe pure nothrow @nogc
if(isFloatingPoint!F){
	import std.math: PI;
	return cast(F)(PI/180.0*angleDeg);
}

/****************************
 * Unit conversion from radians to degrees
 *
 * Params:
 *     angleRad= angle in radians
 *
 * Returns:
 *     angle in degrees
 ****************************/
F radToDeg(F)(in F angleRad) @safe pure nothrow @nogc
if(isFloatingPoint!F){
	import std.math: PI;
	return cast(F)(180.0/PI*angleRad);
}

/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/LEE/Desktop/project_3/project_3.srcs/sources_1/imports/Question1-2/FIFO.vhd";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_3887038524_3212880686_p_0(char *t0)
{
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    char *t8;
    unsigned char t9;
    unsigned char t10;
    int t11;
    int t12;
    unsigned char t13;
    char *t14;
    char *t15;
    int t16;
    int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;

LAB0:    xsi_set_current_line(36, ng0);
    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 4352);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(37, ng0);
    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 != 0)
        goto LAB5;

LAB7:    xsi_set_current_line(46, ng0);
    t1 = (t0 + 1672U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t5 = (t2 == (unsigned char)3);
    if (t5 != 0)
        goto LAB8;

LAB10:
LAB9:    xsi_set_current_line(64, ng0);
    t1 = (t0 + 1352U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t5 = (t2 == (unsigned char)3);
    if (t5 != 0)
        goto LAB20;

LAB22:
LAB21:    xsi_set_current_line(81, ng0);
    t1 = (t0 + 2808U);
    t3 = *((char **)t1);
    t11 = *((int *)t3);
    t1 = (t0 + 2928U);
    t4 = *((char **)t1);
    t12 = *((int *)t4);
    t2 = (t11 == t12);
    if (t2 != 0)
        goto LAB32;

LAB34:    xsi_set_current_line(88, ng0);
    t1 = (t0 + 4496);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(89, ng0);
    t1 = (t0 + 4432);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB33:
LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(38, ng0);
    t3 = (t0 + 2808U);
    t7 = *((char **)t3);
    t3 = (t7 + 0);
    *((int *)t3) = 0;
    xsi_set_current_line(39, ng0);
    t1 = (t0 + 2928U);
    t3 = *((char **)t1);
    t1 = (t3 + 0);
    *((int *)t1) = 0;
    xsi_set_current_line(41, ng0);
    t1 = (t0 + 3048U);
    t3 = *((char **)t1);
    t1 = (t3 + 0);
    *((unsigned char *)t1) = (unsigned char)0;
    xsi_set_current_line(43, ng0);
    t1 = (t0 + 4432);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(44, ng0);
    t1 = (t0 + 4496);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB6;

LAB8:    xsi_set_current_line(47, ng0);
    t1 = (t0 + 3048U);
    t4 = *((char **)t1);
    t9 = *((unsigned char *)t4);
    t10 = (t9 == (unsigned char)1);
    if (t10 == 1)
        goto LAB14;

LAB15:    t1 = (t0 + 2808U);
    t7 = *((char **)t1);
    t11 = *((int *)t7);
    t1 = (t0 + 2928U);
    t8 = *((char **)t1);
    t12 = *((int *)t8);
    t13 = (t11 != t12);
    t6 = t13;

LAB16:    if (t6 != 0)
        goto LAB11;

LAB13:
LAB12:    goto LAB9;

LAB11:    xsi_set_current_line(49, ng0);
    t1 = (t0 + 2688U);
    t14 = *((char **)t1);
    t1 = (t0 + 2928U);
    t15 = *((char **)t1);
    t16 = *((int *)t15);
    t17 = (t16 - 0);
    t18 = (t17 * 1);
    xsi_vhdl_check_range_of_index(0, 255, 1, t16);
    t19 = (8U * t18);
    t20 = (0 + t19);
    t1 = (t14 + t20);
    t21 = (t0 + 4560);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    memcpy(t25, t1, 8U);
    xsi_driver_first_trans_fast_port(t21);
    xsi_set_current_line(52, ng0);
    t1 = (t0 + 2928U);
    t3 = *((char **)t1);
    t11 = *((int *)t3);
    t12 = (256 - 1);
    t2 = (t11 == t12);
    if (t2 != 0)
        goto LAB17;

LAB19:    xsi_set_current_line(57, ng0);
    t1 = (t0 + 2928U);
    t3 = *((char **)t1);
    t11 = *((int *)t3);
    t12 = (t11 + 1);
    t1 = (t0 + 2928U);
    t4 = *((char **)t1);
    t1 = (t4 + 0);
    *((int *)t1) = t12;

LAB18:    goto LAB12;

LAB14:    t6 = (unsigned char)1;
    goto LAB16;

LAB17:    xsi_set_current_line(53, ng0);
    t1 = (t0 + 2928U);
    t4 = *((char **)t1);
    t1 = (t4 + 0);
    *((int *)t1) = 0;
    xsi_set_current_line(55, ng0);
    t1 = (t0 + 3048U);
    t3 = *((char **)t1);
    t1 = (t3 + 0);
    *((unsigned char *)t1) = (unsigned char)0;
    goto LAB18;

LAB20:    xsi_set_current_line(65, ng0);
    t1 = (t0 + 3048U);
    t4 = *((char **)t1);
    t9 = *((unsigned char *)t4);
    t10 = (t9 == (unsigned char)0);
    if (t10 == 1)
        goto LAB26;

LAB27:    t1 = (t0 + 2808U);
    t7 = *((char **)t1);
    t11 = *((int *)t7);
    t1 = (t0 + 2928U);
    t8 = *((char **)t1);
    t12 = *((int *)t8);
    t13 = (t11 != t12);
    t6 = t13;

LAB28:    if (t6 != 0)
        goto LAB23;

LAB25:
LAB24:    goto LAB21;

LAB23:    xsi_set_current_line(67, ng0);
    t1 = (t0 + 1512U);
    t14 = *((char **)t1);
    t1 = (t0 + 2688U);
    t15 = *((char **)t1);
    t1 = (t0 + 2808U);
    t21 = *((char **)t1);
    t16 = *((int *)t21);
    t17 = (t16 - 0);
    t18 = (t17 * 1);
    xsi_vhdl_check_range_of_index(0, 255, 1, t16);
    t19 = (8U * t18);
    t20 = (0 + t19);
    t1 = (t15 + t20);
    memcpy(t1, t14, 8U);
    xsi_set_current_line(70, ng0);
    t1 = (t0 + 2808U);
    t3 = *((char **)t1);
    t11 = *((int *)t3);
    t12 = (256 - 1);
    t2 = (t11 == t12);
    if (t2 != 0)
        goto LAB29;

LAB31:    xsi_set_current_line(75, ng0);
    t1 = (t0 + 2808U);
    t3 = *((char **)t1);
    t11 = *((int *)t3);
    t12 = (t11 + 1);
    t1 = (t0 + 2808U);
    t4 = *((char **)t1);
    t1 = (t4 + 0);
    *((int *)t1) = t12;

LAB30:    goto LAB24;

LAB26:    t6 = (unsigned char)1;
    goto LAB28;

LAB29:    xsi_set_current_line(71, ng0);
    t1 = (t0 + 2808U);
    t4 = *((char **)t1);
    t1 = (t4 + 0);
    *((int *)t1) = 0;
    xsi_set_current_line(73, ng0);
    t1 = (t0 + 3048U);
    t3 = *((char **)t1);
    t1 = (t3 + 0);
    *((unsigned char *)t1) = (unsigned char)1;
    goto LAB30;

LAB32:    xsi_set_current_line(82, ng0);
    t1 = (t0 + 3048U);
    t7 = *((char **)t1);
    t5 = *((unsigned char *)t7);
    if (t5 != 0)
        goto LAB35;

LAB37:    xsi_set_current_line(85, ng0);
    t1 = (t0 + 4496);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);

LAB36:    goto LAB33;

LAB35:    xsi_set_current_line(83, ng0);
    t1 = (t0 + 4432);
    t8 = (t1 + 56U);
    t14 = *((char **)t8);
    t15 = (t14 + 56U);
    t21 = *((char **)t15);
    *((unsigned char *)t21) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB36;

}


extern void work_a_3887038524_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3887038524_3212880686_p_0};
	xsi_register_didat("work_a_3887038524_3212880686", "isim/testbench.exe.sim/work/a_3887038524_3212880686.didat");
	xsi_register_executes(pe);
}

.globl my_test_pix_sum_c
my_test_pix_sum_c:   

 	mov	ip, sp
 	stm.w	(r17, r18, r19, r20, r21, r22, r23, r24, r25, sl, fp, ip, lr, pc), [sp-]

 	sub	fp, ip, #4	
 	sub	sp, sp, #112

#fp-72:line_size, fp-68:Դ����ָ�룻r14�ۼӽ����r15������	

#r17Դ����ָ��r0��r18line_size-16 r1-16
	mov    r17, r0
	mov    r18, r1
 	sub	r18, r18, #16

#r19�ۼӼ�����
	mov    r19, #0

#r20������i��r21������j
	mov	r20, #0	
	mov	r21, #0

#��ת���Լ�����i(r15/fp-60)���ж�
 	b	 ijudge

#������i(r15/fp-60)�Ƚ����,���r15С�ڵ���15������ת����
#��ע�⣬r15�ڴ˴��ֱ���Ϊ������j���洢��fp-56
icontinue:

#��ת��������j���ж�
 	b	 jjudge

#������jС�ڵ���15����׼���ˣ���ʼ�ۼ�����
jcontinue:
 	nop
#�ӷ�����	
 	ldb	r22, [r17+]
 	add	r19, r19, r22
 	ldb	r22, [r17+],#1
 	add	r19, r19, r22

 	ldb	r22, [r17+],#2
 	add	r19, r19, r22
 	ldb	r22, [r17+],#3
 	add	r19, r19, r22

 	ldb	r22, [r17+],#4
 	add	r19, r19, r22
 	ldb	r22, [r17+],#5
 	add	r19, r19, r22

 	ldb	r22, [r17+],#6
 	add	r19, r19, r22
 	ldb	r22, [r17+],#7
 	add	r19, r19, r22

#Դ����ָ���8�� pix += 8;
 	add	r17, r17, #8
#������j��8
 	add	r21, r21, #8

#������j(fp-56)�ж��Ƿ�С�ڵ���15
jjudge:
 	cmpsub.a	r21, #15
 	bel	 jcontinue

#����line_size������16
# 	sub	r18, r18, #16 XX
#����������������mov line_size��ʱ��Ҫֱ��������Ϊ

#��Դ����ָ��������Ʋ��� pix += line_size - 16;
 	add	r17, r17, r18

#�Լ�����i(fp-60)���м�һ����
 	add	r20, r20, #1	
#�Լ�����j����
 	mov	r21, #0

#������i(r15/fp-60)��15�Ƚϣ�С�ڵ���15����ת��2000040c
ijudge:
 	cmpsub.a	r20, #15	
 	bel	icontinue

#����������r14��r0
#����������r19��r0
 	mov	r0, r19

 	ldm	(r17, r18, r19, r20, r21, r22, r23, r24, r25, sl, fp, sp, pc), [fp-]
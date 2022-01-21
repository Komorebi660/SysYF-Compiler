#include<stdio.h>
/* Input & output functions */
int get_int(){int t; scanf("%d",&t); return t; }
int get_float(){float t; scanf("%f",&t); return t; }
int get_char(){char c; scanf("%c",&c); return (int)c; }
int get_int_array(int a[]){
  int n;
  scanf("%d",&n);
  for(int i=0;i<n;i++)scanf("%d",&a[i]);
  return n;
}
int get_float_array(float a[]){
  int n;
  scanf("%d",&n);
  for(int i=0;i<n;i++)scanf("%f",&a[i]);
  return n;
}
void put_int(int a){ printf("%d",a); }
void put_float(float a){ printf("%f",a); }
void put_char(int a){ printf("%c",a); }
void put_int_array(int n, int a[]){
  printf("%d:",n);
  for(int i=0;i<n;i++)printf(" %d",a[i]);
  printf("\n");
}
void put_float_array(int n, float a[]){
  printf("%d:",n);
  for(int i=0;i<n;i++)printf(" %f",a[i]);
  printf("\n");
}

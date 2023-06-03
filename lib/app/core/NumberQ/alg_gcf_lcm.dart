int algGCF(int num1, int num2) {
  int resto;
  int a;
  int b;
  a = num1;
  b = num2;
  do {
    resto = a % b;
    a = b;
    b = resto;
  } while (resto != 0);
  return (num1 * num2) ~/ a;
}

int algLCM(int num1, int num2) {
  int resto;
  do {
    resto = num1 % num2;
    num1 = num2;
    num2 = resto;
  } while (resto != 0);
  return num1;
}
/*
void main() {
  int num1 = 4;
  int num2 = 8;
  print('GCF/MDC = ${algGCF(num1, num2)}');
  print('GCF = ${algGCF(num2, num1)}');
  print('LCM/MMC = ${algLCM(num1, num2)}');
  print('LCM = ${algLCM(num2, num1)}');
}

GCF = 8
GCF = 8
LCM = 4
LCM = 4

M : 1 2 3 4 5 6 7 8 9
4: 4 8 12 16 20
8: 8 16 24
F
4: 1 2 4
8: 1 2 4 8


GCF = 6
GCF = 6
LCM = 1
LCM = 1

M
2: 2 4 6 8
3: 3 6 9 12
F
2: 1 2
3: 1 3


*/
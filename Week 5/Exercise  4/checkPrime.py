num = int(input("Enter a number: "))
isPrime = True



for i in range(1, num):
    if (num%i == 0 and i!= num and i!=1):
        isPrime = False
        break

print(f'isPrime: {isPrime}')
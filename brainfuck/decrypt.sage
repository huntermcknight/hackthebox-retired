"""
A script for RSA decrypting the root flag of Brainfuck HTB
"""

# p = 7493025776465062819629921475535241674460826792785520881387158343265274170009282504884941039852933109163193651830303308312565580445669284847225535166520307
# q = 7020854527787566735458858381555452648322845008266612906844847937070333480373963284146649074252278753696897245898433245929775591091774274652021374143174079
# e = 30802007917952508422792869021689193927485016332713622527025219105154254472344627284947779726280995431947454292782426313255523137610532323813714483639434257536830062768286377920010841850346837238015571464755074669373110411870331706974573498912126641409821855678581804467608824177508976254759319210955977053997

params = open('/home/orestis/debug.txt').readlines()

p = Integer(params[0].strip())
q = Integer(params[1].strip())
e = Integer(params[2].strip())

# c = 44641914821074071930297814589851746700593470770417111804648920018396305246956127337150936081144106405284134845851392541080862652386840869768622438038690803472550278042463029816028777378141217023336710545449512973950591755053735796799773369044083673911035030605581144977552865771395578778515514288930832915182

c = Integer(open('/home/orestis/output.txt').read().strip().split(' ')[2])

n = p * q

phi = (p - 1) * (q - 1)

# Calculate decryption key d from e and phi

d = e.inverse_mod(phi)

flag_dec = pow(c, d, n)

flag_hex = hex(int(flag_dec))

flag = flag_hex[2:-1].decode('hex')

print(flag)



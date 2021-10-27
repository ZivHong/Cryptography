from cipher_solver.simple import SimpleSolver

ciphertext = open("ciphertext.txt").read()
s = SimpleSolver(ciphertext)
s.solve()
print(f"The key is : {s.decryption_key()}")
file = f"{'*'*20} Encryption Key {'*'*20}\n{s.decryption_key()}\n{'*'*20} Plaintext {'*'*20}\n{s.plaintext()}"
open("plain.txt", "w").write(file)
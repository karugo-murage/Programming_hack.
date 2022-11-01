print ("ENTER A WORD OR SENTENCE AND I WILL TELL IF IT IS PALINDROME OR NOT")
test_word = input()
test_word = test_word.replace(" ","")
test_word = test_word.lower()
print(test_word)
foward_state=list(test_word)
print (foward_state)
reversed_state = foward_state[::-1]
print (reversed_state)
if (foward_state == reversed_state):
    print("THE WORD IS PALINDROME")
else:
    print("THE WORD IS NOT PALINDROME")

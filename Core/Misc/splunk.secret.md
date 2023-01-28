# splunk.secret

- https://pypi.org/project/splunksecrets/

## Splunk Pre 7.2

Splunk prior to 7.2 used RC4 encryption for secrets, indicated in configuration files by $1$ in the encrypted password. The plaintext password is XOR’ed with a static salt (DEFAULTSA) and then RC4 encrypted using the first 16-bytes of splunk.secret as the key. The resulting ciphertext is base64-encoded and prepended with $1$ to produce the encrypted password seen in the configuration files.

## Splunk 7.2+

Starting in Splunk 7.2, AES256-GCM is used for encryption of secrets, indicated in configuration files by $7$ in the encrypted password. The PBKDF2 algorithm is used to derive an encryption key from all 254 bytes of splunk.secret (the newline character is stripped from the end of the file), using a static salt of disk-encryption and a single iteration. This 256-bit key is then used as the encryption key for AES256-GCM, with a 16-byte randomly generated initialization vector. The encryption produces both the ciphertext as well as a “tag” that is used as part of integrity verification. The iv, ciphertext, and tag (in that order) are concatenated, base64-encoded, and prepended with $7$ to produce the encrypted password seen in the configuration files.


## READ THIS AND UPDATE 

7.2
AES-GCM used to replace old RC4 encryption SPL-149543 (old password in conf files will now be encrypted
 AES-GCM encrypted keys starts with secret = $7$***** (new passwords)
 RC4 encrypted keys starts with secret = $1$***** (old passwords)
 
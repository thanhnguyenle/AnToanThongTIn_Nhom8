package model;
import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.SecureRandom;
import java.security.Signature;
import java.security.SignatureException;

import javax.crypto.KeyGenerator;

public class GenerateDigitalSignature {
	public static void main(String[] args) {
		try {
			KeyPairGenerator keyGen = KeyPairGenerator.getInstance("DSA", "SUN");
			SecureRandom random = SecureRandom.getInstance("SHA1PRNG", "SUN");
			keyGen.initialize(1024, random);  
			KeyPair pair = keyGen.generateKeyPair();  
			PrivateKey priv = pair.getPrivate();  
			PublicKey pub = pair.getPublic();  
			/* Create a Signature object and initialize it with the private key */  
			Signature dsa = Signature.getInstance("SHA1withDSA", "SUN");   
			dsa.initSign(priv);  
			/* Update and sign the data */  
			FileInputStream fis = new FileInputStream("E:\\ForCode\\Ideal\\ATTT\\AnToanThongTin_Nhom8\\DigitalSignature\\data\\digital.txt");  
			BufferedInputStream bufin = new BufferedInputStream(fis);  
			byte[] buffer = new byte[1024];  
			int len;  
			while (bufin.available() != 0)   
			{  
			len = bufin.read(buffer);  
			dsa.update(buffer, 0, len);  
			};  
			bufin.close();  
			/* Now that all the data to be signed has been read in,  
			generate a signature for it */  
			byte[] realSig = dsa.sign();  
			/* Save the signature in a file */  
			FileOutputStream sigfos = new FileOutputStream("E:\\ForCode\\Ideal\\ATTT\\AnToanThongTin_Nhom8\\DigitalSignature\\data\\signature.txt");  
			sigfos.write(realSig);  
			sigfos.close();  
			/* Save the public key in a file */  
			byte[] key = pub.getEncoded();  
			FileOutputStream keyfos = new FileOutputStream("E:\\ForCode\\Ideal\\ATTT\\AnToanThongTin_Nhom8\\DigitalSignature\\data\\publickey.txt");  
			keyfos.write(key);  
			keyfos.close();  
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchProviderException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvalidKeyException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SignatureException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}

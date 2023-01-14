package com.example.demo.Auth;

import java.util.Base64;

public class AuthTokenHandler {
	public static String GetEmailFromAuthToken(String token) {
 		String[] chunks=token.split("\\.");
		Base64.Decoder decoder=Base64.getUrlDecoder();
 		String payload = new String(decoder.decode(chunks[1]));
 		String[] valStrings=payload.split("\"");
 		return valStrings[3];
	}
 }

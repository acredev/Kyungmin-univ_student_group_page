package chk;

import java.util.HashMap;

import org.json.simple.JSONObject;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class TelChk
{
	public int telchk (String tel)
	{
		// coolSMS 연결 API키
		String api_key = "";
		String api_secret = "";
		Message coolsms = new Message(api_key, api_secret);
				
		// 인증번호 난수 발생
		int chknum = (int)(Math.random() * 100000);
				
		// 문자 보낼 내용 결정
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", tel);
		params.put("from", "01084295741");
		params.put("type", "SMS");
		params.put("text", "[경민대학교 대나무숲] 인증번호는 " + chknum + "입니다.");
		params.put("app_version", "test");
				
		try
		{
			JSONObject obj = (JSONObject)coolsms.send(params);
			System.out.println(obj.toString());
		}
		catch (CoolsmsException cEx)
		{
			System.out.println(cEx.getMessage());
			System.out.println(cEx.getCode());
		}
		finally
		{
			
		}
		// 난수값 반환
		return chknum;
	}
}

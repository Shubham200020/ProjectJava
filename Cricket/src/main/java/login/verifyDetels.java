package login;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
public class verifyDetels {
	public static boolean isNumber(String user)
	{
		int num=user.length();
		char charactor;
		for(int i=0;i<num;i++)
		{
			charactor=user.charAt(i);
			if(!Character.isDigit(charactor))
			{
				return false;
			}
					
		}
		return true;
	}
	   public static boolean isEmail(String email) {
	        // Regular expression pattern for matching email addresses
	        String regex = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$";
	        
	        // Compile the pattern
	        Pattern pattern = Pattern.compile(regex);
	        
	        // Match the pattern against the provided email
	        Matcher matcher = pattern.matcher(email);
	        
	        // Return true if it matches, false otherwise
	        return matcher.matches();
	    }
	   public boolean compare(String data,String name)
	   {
		   if(data.equalsIgnoreCase(name))
		   {
			   return true;
		   }
		   return false;
	   }

}

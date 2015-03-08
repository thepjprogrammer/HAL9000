package centralProcessing.data;

public class GuessDataObject {
	public double guess;
	public String response;
	
	public GuessDataObject(double computerGuess, String userResponse)
	{
		this.guess = computerGuess;
		this.response = userResponse;
	}
}

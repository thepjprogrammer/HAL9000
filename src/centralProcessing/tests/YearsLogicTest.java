package centralProcessing.tests;

import java.util.Vector;
import java.util.Stack;

public class YearsLogicTest extends FiniteRangeLogicTest {

	public YearsLogicTest() {
		super();
		variance = 50;
		
		//1965 (50)
		testStartRange = 1900;
		testEndRange = 2050;
	}

	/**@Override
	public double getNextGuess(Stack<Double> priorGuesses, String lastUserResponse, double currentMin,
			double currentMax) {
		double currentGuess = 0;
		
		while(currentGuess < currentMax)
		{
			//if this guess has been tried before - try another value
			
			if((priorGuesses.contains(new Double(currentGuess))))
				currentGuess++;
			else
				break;
		}
			
		return currentGuess;
	}

	@Override
	public boolean isTestComplete(Stack<Double> priorGuesses, String lastUserResponse) {
		// TODO Auto-generated method stub
		return false;
	}**/

}

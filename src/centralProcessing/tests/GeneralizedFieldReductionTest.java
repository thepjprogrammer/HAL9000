package centralProcessing.tests;

import java.util.Stack;
import centralProcessing.strategies.LogicalTestingStrategy;
import centralProcessing.strategies.PositiveHalvingStrategy;


public class GeneralizedFieldReductionTest extends LogicTest {

	private LogicalTestingStrategy currentStrategy;
	
	public GeneralizedFieldReductionTest()
	{
		currentStrategy = new PositiveHalvingStrategy();
	}
	
	@Override
	public double getNextGuess(Stack<Double> priorGuesses,
			String lastUserResponse, double currentMin, double currentMax) {
		
		double currentGuess = currentStrategy.makeGuess(priorGuesses, lastUserResponse, currentMin, currentMax);
		return currentGuess;
	}

	@Override
	public boolean isComplete(Stack<Double> priorGuesses,
			String lastUserResponse) {
		
		if("correct".equals(lastUserResponse))
			return true;

		return false;
	}

}

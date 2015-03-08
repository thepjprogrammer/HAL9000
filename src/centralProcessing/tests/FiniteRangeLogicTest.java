package centralProcessing.tests;

import java.util.Vector;
import java.util.Stack;
import centralProcessing.strategies.LogicalTestingStrategy;

public abstract class FiniteRangeLogicTest extends LogicTest 
{
	protected double testStartRange;
	protected double testEndRange;
	protected double initialGuess;
	protected int numberRuns;
	
	//currently tested range
	protected Double testedMin;
	protected Double testedMax;
	protected LogicalTestingStrategy currentStrategy;

	
	@Override
	public double getNextGuess(Stack<Double> priorGuesses, String lastUserResponse, double currentMin,
			double currentMax) {
		
		double currentGuess = 0;		
		
		//its the first guess
		if(numberRuns == 0)
		{
			double computedVariance = variance * Math.random();
			double startingPoint = (testStartRange > currentMin) ? testStartRange : currentMin;
			currentGuess = startingPoint + Math.floor(computedVariance);
			
			testedMin = new Double(currentGuess);
			numberRuns++;
		}
		//check if the lower bounds test provided total test min coverage
		else if(numberRuns == 1 && lastUserResponse.equals("lower"))
		{
			//ensure total lower bound coverage
			if(testedMin.doubleValue() > testStartRange)
			{
				currentGuess = testStartRange;
				testedMin = new Double(currentGuess);
				numberRuns++;
			}
		}
		//make initial upper bounds check
		else if(numberRuns == 1 && lastUserResponse.equals("higher"))
		{
			//test upper bounds
			//may add some variance to this in the future
			currentGuess = testEndRange;
			testedMax = new Double(currentGuess);
			//we now know that the number is not in the lower range
			testedMin = new Double(testStartRange);
			numberRuns++;
		}
		//if within bounds discern answer
		else
		{
			currentGuess = currentStrategy.makeGuess(priorGuesses, lastUserResponse, currentMin, currentMax);
		}	
		return currentGuess;
	}

	@Override
	public boolean isComplete(Stack<Double> priorGuesses, String lastUserResponse) {
		//conditions for completion
		//1. both ends must be tested
		if(testedMin != null && testedMin.doubleValue() == testStartRange)
		{
			//2. if lower bound has been tested and number is lower than lower bound test complete
			if(priorGuesses.peek() == testStartRange && "lower".equals(lastUserResponse))
			{
				return true;
			}
		}
		else if( testedMax != null && testedMax.doubleValue() == testEndRange)
		{
			//3. if upper bound has been tested and number is higher than upper bounds test is complete
			if(priorGuesses.peek() == testEndRange && "higher".equals(lastUserResponse))
			{
				return true;
			}
		}

		return false;
	}

}

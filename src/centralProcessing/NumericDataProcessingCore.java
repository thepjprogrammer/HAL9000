package centralProcessing;
import java.util.*;
import centralProcessing.tests.LogicTest;
import centralProcessing.tests.BenjaminLogicTest;
import centralProcessing.tests.YearsLogicTest;
import centralProcessing.tests.GeneralizedFieldReductionTest;

public class NumericDataProcessingCore 
{
	private Stack<Double> previousGuesses;
	//max = 9000000000000000D;
	private double max;
	//min = 9000000000000000D;
	private double min;
	private Vector<LogicTest> numericValueIsolationTests = new Vector<LogicTest>();
	private int currentTestNumber = 0;
	
	public NumericDataProcessingCore()
	{
		previousGuesses = new Stack<Double>();
		max = 9000000000D;
		min = 0;
		
		numericValueIsolationTests.add(new BenjaminLogicTest());
		numericValueIsolationTests.add(new YearsLogicTest());
		numericValueIsolationTests.add(new GeneralizedFieldReductionTest());
	}
	
	public int getNextGuessNumber()
	{
		return previousGuesses.size() + 1;
	}
	
	public void resetBounds(String guessResponse)
	{
		if(guessResponse.equals("higher"))
		{
			//if the last guess 
			if(previousGuesses.peek() > new Double(min))
			{
				min = previousGuesses.peek().doubleValue();
			}
		}
		else if(guessResponse.equals("lower"))
		{
			//if the last guess 
			if(previousGuesses.peek() < new Double(max))
			{
				max = previousGuesses.peek().doubleValue();
			}
		}
	}
	
	public double getNextGuess(String previousGuessResponse)
	{
		resetBounds(previousGuessResponse);
				
		LogicTest currentTest = numericValueIsolationTests.elementAt(currentTestNumber);
		if(currentTest.isComplete(previousGuesses, previousGuessResponse))
		{
			currentTestNumber++;
			//ensure there is another test to run :)
			if(numericValueIsolationTests.size() > currentTestNumber - 1)
			{
				currentTest = numericValueIsolationTests.elementAt(currentTestNumber);
			}
		}

		
		double guess = currentTest.getNextGuess(previousGuesses, previousGuessResponse, min, max);
		previousGuesses.push(new Double(guess));
			
		return guess;
	}
}
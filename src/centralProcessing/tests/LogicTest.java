package centralProcessing.tests;

import java.util.Vector;
import java.util.Stack;

public abstract class LogicTest 
{
		protected int variance;
		
		public LogicTest(){}
		
		public abstract double getNextGuess(Stack<Double> priorGuesses, String lastUserResponse, double currentMin, double currentMax);
		public abstract boolean isComplete(Stack<Double> priorGuesses, String lastUserResponse);
}

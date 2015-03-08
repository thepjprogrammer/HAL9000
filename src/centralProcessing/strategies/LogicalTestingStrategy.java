package centralProcessing.strategies;

import java.util.Vector;

public abstract class LogicalTestingStrategy {
	protected int variance;
	
	public abstract double makeGuess(Vector<Double> priorGuesses, String lastUserResponse, double currentMin,
			double currentMax);
}

package centralProcessing.strategies;

import java.util.Vector;

public class PositiveHalvingStrategy extends LogicalTestingStrategy {

	public PositiveHalvingStrategy() {
		super();
		variance = 5;
		//there is no explicit test start and end range
	}

	@Override
	public double makeGuess(Vector<Double> priorGuesses, String lastUserResponse, double currentMin,
		   double currentMax) {
		
		double currentGuess = (Math.floor((currentMax - currentMin) / 2) + currentMin);
		//double currentGuess = (currentMin > 0) ? (Math.floor((currentMax - currentMin) / 2) + currentMin) : (currentMin - (Math.floor((currentMax + currentMin) / 2)));

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

}

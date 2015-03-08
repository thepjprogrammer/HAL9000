package logicControllers;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.PrintWriter;
import centralProcessing.NumericDataProcessingCore;

/**
 * Servlet implementation class MainLogicController
 */
@WebServlet("/MainLogicController")
public class MainLogicController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private NumericDataProcessingCore decisionModel;
	
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainLogicController() {
        super();
        // TODO Auto-generated constructor stub
    }

    public void init (ServletConfig config)throws ServletException
    {
    	decisionModel = new NumericDataProcessingCore();
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String task = request.getParameter("task");
		
		if(task.equals("guess"))
		{	
			String prevGuessResp = request.getParameter("responseToPrevGuess");
			
			if("correct".equals(prevGuessResp))
			{
				decisionModel = new NumericDataProcessingCore();
			}
			else
			{
				double nextGuess = decisionModel.getNextGuess(prevGuessResp);
				
				//return calculated answer :)
				response.setStatus(HttpServletResponse.SC_OK);
				PrintWriter out = response.getWriter();
				String guessAsJsonStr = "{\"guess\": "+nextGuess+"}";
				out.print(guessAsJsonStr);
				out.flush();
			}
		}
	}

}

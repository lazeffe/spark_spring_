package aop;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;
import org.springframework.util.StopWatch;

public class LoggingAdvice implements MethodInterceptor {

  @Override
  public Object invoke(MethodInvocation methodInvocation) throws Throwable {
    String methodName = methodInvocation.getMethod().getName();
    StopWatch sw = new StopWatch();

    sw.start(methodName);

    System.out.println("[LOG]METHOD : " + methodName + " call start");

    Object rtnObj = methodInvocation.proceed();

    sw.stop();

    System.out.println("[LOG]METHOD : " + methodName + " call end");

    System.out.println("[LOG]METHOD RUNNING TIME: " + sw.getTotalTimeMillis()/1000 + "seconds");

    return rtnObj;
  }
}

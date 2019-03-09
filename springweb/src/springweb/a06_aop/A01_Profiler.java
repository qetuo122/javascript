package springweb.a06_aop;

import org.aspectj.lang.ProceedingJoinPoint;
// springweb.a06_aop.A01_Profiler
// 수행할 내용 처리 advice 클래스
public class A01_Profiler {

	// 특정한 시점에서 해당 프로그램 내용이 진행되게 처리..
	public Object trace(ProceedingJoinPoint jointPoint) {
		// 해당 하는 메서드가 수행하는 시작 시간과
		// 1. 해당 모듈의 정보 출력..
		String signatureString = jointPoint.getSignature().toShortString();
		System.out.println(signatureString + "의 시작!!");
		// 2. 현재 해당 내용을 수행 하는 시점을 나타내는 기능메서드
		long start = System.currentTimeMillis();
		
		Object result=null;
		
		try {
			// 해당 객체 실행..
			result = jointPoint.proceed();
		} catch (Throwable e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// 끝나는 시간을 처리하여 수행을 확인하는 advice 확인.
			long finish = System.currentTimeMillis();
			System.out.println(signatureString+"종료!!");
			System.out.println(signatureString+"의 수행 시작:"
			+(finish-start)+"ms");
			
			
		}
		
		// 마지막 시간을 log 처리하는 기능.
		
		return result;
	}
	
}

package springweb.c01_batch;

import java.util.Date;

import org.springframework.scheduling.annotation.Scheduled;

public class LogProcessor {

	@Scheduled(fixedRate = 10000)
	public void handle() {
		System.out.println("LogProcessor.handle(): " + new Date());
	}
}
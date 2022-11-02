package medihunter.scheduler

import kotlinx.coroutines.*
import okio.*

suspend fun main() {
    println("before");
    Runtime.getRuntime().exec("bash ./run-medihunter-single-wozny.sh");
    println("after");
    delay(1000 * 1000L);
    println("exit");
}

fun oldMain() {
    runBlocking<Unit> {
        //given
        val job = launch(Dispatchers.Default) {
            println("before");
//            println(Runtime.getRuntime().exec("echo test;").pid());
            Runtime.getRuntime().exec("bash ./run-medihunter-single-wozny.sh")
                .inputStream
                .source()
                .buffer()
                .use {
                    with( Buffer() ){
                        writeAll(it)
                        println("${String(this.readByteArray())}")
                    }
                }
            println("after");
//                while (isActive) {
//                println("is working")
//            }
        }

        delay(10 * 1000L)


        job.cancel()

        println("cancelled")
    }
}


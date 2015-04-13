This project aims to find out and compare **the minimal overhead of each PHP framework**.

To achieve this goal, a simple 'hello world' application is developed for each framework. The application is optimized to be as fast as possible so that the overhead measured is more accurate for a framework.


## Why 'hello world' ##

In today's Web 2.0 applications, frameworks need to pay more attention to performance because Web requests tend to be smaller AJAX requests that are in larger quantity. For example, the application needs to fulfill an AJAX request to display the current server time. The 'hello world' test is very similar to this more realistic scenario.

Another reason that we do 'hello world' instead of an application involving database access and full view rendering is that the more features the test application uses, the more potential unfairness could be involved. For example, a framework does automatic layout when rendering while another framework does; a framework is equipped with view caching while another one only has data caching; and so on.


## Do not interpret the numbers alone ##

The benchmarking results should NEVER be interpreted alone. The server configuration and the way of running the benchmarking applications could affect the results significantly.

And do not choose a framework purely based on this benchmarking result. You should consider many other factors, such as feature set, documentation, code quality, user community, technical support, etc. We all know that using a plain PHP script would easily beat any of the frameworks in performance comparison.


## Do not feel attacked ##

This project has no intention to attack any framework. On the contrary, it tries to help frameworks to find out their performance bottlenecks and make improvements.

**If you find any of the test applications is not optimized properly, please let us know. We are more than happy to adjust it.**
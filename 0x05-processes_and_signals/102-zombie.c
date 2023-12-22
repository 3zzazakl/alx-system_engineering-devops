#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/types.h>

/**
 * infinite - infinite loop
 * Return: (0)
 */
int infinite(void)
{
	while (1)
		sleep(1);

	return (0);
}

/**
 * main - main
 * Return: (0)
 */
int main(void)
{
	pid_t child;
	int i;

	for (i = 0; i < 5; i++)
	{
		child = fork();
		if (child > 0)
		{
			printf("Zombie process created, PID: %d\n", child);
			sleep(1);
		}
		else
			exit(0);
	}
	infinite();
	return (0);
}

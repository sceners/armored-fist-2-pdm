
#include <stdlib.h>
#include <fcntl.h>
#include <stdio.h>

extern decode ( void *, long);

/*
#define AF2_OFFSET 0x1067D
#define AF2_LENGTH 0x157EA8
*/
#define AF2_OFFSET 0x1067D
#define AF2_LENGTH 0x15BEF8

void main()
{
	void *buf;
	int fd;

	if ((buf = malloc(AF2_LENGTH)) == NULL)
	{
		printf("Need more memory :/\n");
		return;
	}
	if ((fd = open("af2.exe", O_BINARY|O_RDWR)) == -1)
	{
		free(buf);
		printf("Hey dude! Cannot find AF2.EXE :(");
		return;
	}
	lseek(fd, AF2_OFFSET, SEEK_SET);
	if (read(fd, buf, AF2_LENGTH) != AF2_LENGTH)
	{
		printf("Oops! Strange things happens while reading data\n");
		free(buf);
		close(fd);
	}
	printf("Decoding now ...\n");
	decode(buf, AF2_LENGTH);
	lseek(fd, AF2_OFFSET, SEEK_SET);
	if (write(fd, buf, AF2_LENGTH) != AF2_LENGTH)
		printf("Oops! Strange things happens while writing data. Hope u have a BACKUP\n");
	close(fd);
	free(buf);
}

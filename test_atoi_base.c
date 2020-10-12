#include "libasm.h"
#include <string.h>
#include <stdio.h>
#include <stdlib.h>

int	translate_char(char c, const char *charset)
{
	int i;

	i = 0;
	while (charset[i] != c)
		i++;
	return (i);
}

int	validate(const char *num, const char *charset)
{
	int i;
	int j;

	i = 0;
	j = 0;
	while (charset[j] != '\0')
	{
		if (charset[j] == '+' || charset[j] == '-')
			return (0);
		j++;
	}
	if (j < 2)
		return (0);
	j = 0;
	if (num[0] == '+' || num[0] == '-')
		i++;
	while (num[i] != '\0')
	{
		while (charset[j] != '\0')
		{
			if (num[i] == charset[j])
				break;
			if (charset[j + 1] == '\0')
				return (0);
			j++;
		}
		j = 0;
		i++;
	}
	return (1);
}

int my_atoi_base(const char *num, const char *charset)
{
	int base;
	int i = 0;
	int cur;
	int result;

	base = strlen(charset);
	int len = strlen(num);
	result = 0;
	if (validate(num, charset) == 1)
	{
		while (i < len)
		{
			cur = translate_char(num[i], charset);
			result = result * base + cur;
			i++;
		}
		return (result);
	}
	else
		return (0);
}

// unsigned long int strtoul(const char *str, char **endptr, int base)


int main()
{
	int base;
	char str[] = "10";
	char *ptr;

	base = 1;
	// printf("%lu\n", strtoul(str, &ptr, base));

	// printf("%d\n", my_atoi_base(str, "0"));
	printf("%d\n", ft_atoi_base("", "12345615"));
	return (0);
}
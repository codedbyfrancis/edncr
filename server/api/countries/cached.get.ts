export default defineCachedEventHandler(
  async (event) => {
    try {
      const response = await fetch(
        'https://restcountries.com/v3.1/independent?status=true'
      );

      if (!response.ok) {
        throw createError({
          statusCode: response.status,
          statusMessage: `Failed to fetch countries: ${response.statusText}`,
        });
      }

      const countries = await response.json();

      return countries;
    } catch (error) {
      throw createError({
        statusCode: 500,
        statusMessage: 'Failed to fetch countries data',
      });
    }
  },
  {
    maxAge: 60 * 60, // Cache for 1 hour
  }
);

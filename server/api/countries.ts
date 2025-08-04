export default defineEventHandler(async (event) => {
  try {
    // Fetch data from the external API
    const response = await fetch(
      'https://restcountries.com/v3.1/independent?status=true'
    );

    // Check if the response is successful
    if (!response.ok) {
      throw createError({
        statusCode: response.status,
        statusMessage: `Failed to fetch countries: ${response.statusText}`,
      });
    }

    // Parse the JSON response
    const countries = await response.json();

    // Return the data
    return countries;
  } catch (error) {
    // Handle errors
    throw createError({
      statusCode: 500,
      statusMessage: 'Failed to fetch countries data',
    });
  }
});

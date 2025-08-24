import { GoogleGenerativeAI } from '@google/generative-ai';

export default defineEventHandler(async (event) => {
  const body = await readBody<{ message: string }>(event);
  const config = useRuntimeConfig();

  const genAI = new GoogleGenerativeAI(config.geminiKey);
  const model = genAI.getGenerativeModel({
    model: 'gemini-2.5-flash',
  });
  const result = await model.generateContent(body.message);
  console.log(result.response.text());
  return result.response.text();

  // const paragraphs = 5;
  // const sentences = 5;
  // const words = 10;
  // const lorem = Array(paragraphs)
  //   .fill(null)
  //   .map(() =>
  //     Array(sentences)
  //       .fill(null)
  //       .map(() =>
  //         Array(words)
  //           .fill(null)
  //           .map(() => 'Lorem ipsum dolor sit amet')
  //           .join(' ')
  //       )
  //       .join('. ')
  //   )
  //   .join('\n\n');
  // return lorem;
});

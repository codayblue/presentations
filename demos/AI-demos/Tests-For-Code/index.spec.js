import { expect, test } from 'vitest'
import { addIntegers } from './index.js'

test('Function: addIntegers', () => {
	const dataProviders = [
		{
			inputs: [1,1,1,1,1],
			expected: 5
		},
		{
			inputs: [1,2,2],
			expected: 5
		},
		{
			inputs: [3,3],
			expected: 6
		}
	]

	dataProviders.forEach((provider) => {
		expect(addIntegers(...provider.inputs)).toBe(provider.expected)
	})
})